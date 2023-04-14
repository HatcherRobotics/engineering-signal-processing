% ########################################################
% #                  University of Kassel                #
% # Department for RF-Techniques / Communication Systems # 
% #         Wilhelmshoeher Allee 73, 34121 Kassel        #
% #              S. Semmelrodt / August 2003             #
% # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
% #  Comments and bug reports to: sven.semmelrodt@gmx.de #
% ########################################################
%
% Function:   Calculates an ARMA model based PSD estimate using 
%             a two-stage least squares approach.
%
% Call:       [PSD, f] = psd_arma(y, p_AR, p_MA, p_k, <N_FFT>, <fs>)
%
% Parameters: - y     : Vector with signal samples
%             - p_AR  : AR-Modelorder
%             - p_MA  : MA-Modelorder
%             - p_k   : Order of the infinite AR model
%             - N_FFT : Number of FFT points (default N_FFT >= 256)
%             - fs    : Sampling frequency in Hz (default: fs = 1 Hz)
%
% Output:     - PSD    : Power spectral density
%             - f      : Frequency axis
%
% Example:    y1 = sg_cissoid([1 1 1], [0.2 0.3 0.4], 100, 1, 30);
%             y2 = sg_wideband(1, -0.3, -0.1, 100);
%             psd_arma(y1+y2, 8, 5, 20);
%             
function varargout = psd_arma(y, p_AR, p_MA, p_k, varargin);

% Check parameters
error(nargchk(4,6,nargin));
[msg, N_FFT, fs] = chk_param(y, p_AR, p_MA, p_k, varargin{:});
error(msg);

% Get dimensions
N = length(y);

% Get Signal
y = y(:);

% Estimate AR coefficients 
a = armcov(y,p_k);

% Estimate the noise sequence e(t)
e = filter(a, 1, y);       

% Construct the z vector and Z matrix in equations 
L = p_k + p_MA;
z = [y(L+1:N)];
Z = [toeplitz(y(L:N-1), y(L:-1:L-p_AR+1).'), -1 * toeplitz(e(L:N-1), e(L:-1:p_k+1).')];

% Estimate model coefficients 
theta = -Z\z;
a = [1;theta(1:p_AR)];
b = [1;theta(p_AR+1:p_MA+p_AR)];

% Estimate the noise variance
var = norm(Z*theta + z)^2/(N-L);

% Calculate ARMA-Model PSD 
PSD = arma_psd(a, b, var, N_FFT);

% Scale PSD to sampling frequency
PSD = PSD ./ fs;

% Frequency axis
f = fs .* linspace(-0.5,0.5,length(PSD));

% Display results if no output argument is defined
if(nargout == 0)
   figure('name','Two-Stage Least Squares Approach','NumberTitle','off');
   subplot(2,1,1)
   h1 = plot(f, PSD);
   xlabel('Frequency f [Hz]');
   ylabel('Magnitude [1/Hz]');
   title('Power Spectrum Density')
   grid on
   marker(gca)
   subplot(2,1,2)
   h2 = plot(f, 10*log10(PSD));
   xlabel('Frequency f [Hz]');
   ylabel('Magnitude [dB/Hz]');
   grid on
   marker(gca)
else   
   % Assign output arguments
   varargout{1} = PSD;
   varargout{2} = f;
end

return;


% check parameters and setup defaults if necessary
function [msg, N_FFT, fs] = chk_param(y, p_AR, p_MA, p_k, varargin);

% No error message
msg = '';

% Get dimensions
N = length(y);

% Get optional parameters
if(nargin > 4 & ~isempty(varargin{1}))
   N_FFT = varargin{1};
else  
   N_FFT = 512;
end
if(nargin > 5 & ~isempty(varargin{2}))
   fs = varargin{2};
else  
   fs = 1;
end

% Check parameter
if(min(size(y)) > 1 | ndims(y) > 2)
   msg = 'Input signal ''y'' must be a vector.';
   return;
end
if(N_FFT < N)
   warning('FFT length should be greater than the number of signal samples')
   N_FFT = 2^nextpow2(N);
end
if(length(p_AR) > 1)
   msg = 'Model order ''p_AR'' must be a scalar.';
   return;
end
if(round(p_AR) ~= p_AR)
   msg = 'Model order ''p_AR'' must be an integer.';
   return;
end
if(length(p_MA) > 1)
   msg = 'Model order ''p_MA'' must be a scalar.';
   return;
end
if(round(p_MA) ~= p_MA)
   msg = 'Model order ''p_MA'' must be an integer.';
   return;
end
if( p_k < 1 | p_AR < 1 | p_MA < 1)
   msg = 'Model order parameters must be greater than zero.';
   return;
end
if(length(p_k) > 1)
   msg = 'Model order ''p_k'' must be a scalar.';
   return;
end
if(round(p_k) ~= p_k)
   msg = 'Model order ''p_k'' must be an integer.';
   return;
end
if(2*p_k > N)
   msg = 'Model order ''p_k'' must be smaller than half of the number of signal samples.';
   return;
end
if (N-p_k < p_AR+2*p_MA)
   msg = 'Order of the MA or AR model is too large';
   return;
end
if(length(fs) > 1)
   msg = 'Parameter ''fs'' must be a scalar.';
   return;
end
if(fs <= 0)
   msg = 'Parameter ''fs'' must be greater than zero.';
   return;
end
if(issparse(y))
   msg = 'Input signal ''y'' cannot be sparse.';
   return;
end
if(min(size(y)) > 1)
   msg = 'Input signal ''y'' must be a vector.';
   return;
end

return;