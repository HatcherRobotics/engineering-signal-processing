% ########################################################
% #                  University of Kassel                #
% # Department for RF-Techniques / Communication Systems # 
% #         Wilhelmshoeher Allee 73, 34121 Kassel        #
% #              S. Semmelrodt / August 2003             #
% # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
% #  Comments and bug reports to: sven.semmelrodt@gmx.de #
% ########################################################
%
% Function:   Computes a power spectral density (PSD) for 
%             given ARMA coefficients. 
%
% Call:       [PSD, f] = arma_psd(a, b, <var>, <N_FFT>)
%
% Parameters: - a     : AR-Model coefficients
%             - b     : MA-Model coefficients
%             - var   : Variance or noise power
%             - N_FFT : Number of FFT points
%
% Output:     - PSD   : Power spectral density
%             - f     : Frequency axis scaled to fs
%
% Example:    y = sg_cissoid([1 1 0.1], [0.23 0.25 0.4], 25, 1, 30);
%             a = lp_mcov(y, 6);
%             arma_psd(a, 1, [], 1024)
%             
function varargout = arma_psd(a, b, varargin)

% Check parameters
error(nargchk(2,4,nargin));
[msg, a, b, var, N_FFT] = chk_param(a, b, varargin{:});
error(msg);

% Calculate AR-Model (FIR-Filter) frequency response
[h,w] = freqz(b, a, N_FFT, 'whole');

% This is the power spectrum
PSD = fftshift(abs(h).^2); 

% Frequency axis
f = linspace(-0.5,0.5,length(PSD));

% Scale to noise variance if available
if(isempty(var) | (var == 0) | (var == inf))
	PSD = PSD / max(PSD);
else
   PSD = var .* PSD;
end

% Display results if no output argument is defined
if(nargout == 0)
   figure('name','ARMA-Model','NumberTitle','off');
   subplot(2,1,1)
   h1 = plot(f, PSD);
   xlabel('Frequency f [Hz]');
   ylabel('Magnitude');
   title('Power Spectrum Density')
   grid on
   marker(gca)
   subplot(2,1,2)
   h2 = plot(f, 10*log10(PSD));
   xlabel('Frequency f [Hz]');
   ylabel('Magnitude [dB]');
   grid on
   marker(gca)
else   
   % Assign output arguments
   varargout{1} = PSD;
   varargout{2} = f;
end

return;


% check parameters and setup defaults if necessary
function [msg, a, b, var, N_FFT] = chk_param(a, b, varargin);

% No error message
msg = '';

% Get optional parameters
if(nargin > 2 & ~isempty(varargin{1}))
   var = varargin{1};
else
   var = 0;
end
if(nargin > 3 & ~isempty(varargin{2}))
   N_FFT = varargin{2};
else  
   N_FFT = 256;
end
if(isempty(a))
   a = 1;
end
if(isempty(b))
   b = 1;
end

% Check parameter
if(length(var) > 1)
   msg = 'Parameter ''var'' must be a scalar.';
   return;
end

return;
