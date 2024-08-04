clc;
clear;


%%Plotar Gráficos,
%%Contas basicas soma.
%%Criar um vetor
%%Operaçoes com matrizes
%%Criar uma senoide
%%Colocar um ruido nessa senoide
% Filtar o ruido com o filtro media movel

%-----------------------------------------------------

A = 6;
B = 5;
result1 = 0;
result2 = 0;
result3 = 0;
result4 = 0;

result1 = A + B;
result2 = A - B;
result3 = A * B;
result4 = A / B;

%-----------------------------------------------------

vetor1 = [1, 2, 3, 4, 5]; % linha
vetor2 = [1; 2; 3; 4; 5]; % coluna

matriz1 = [ 1,2,3 ; 4,5,6 ; 7,8,9];
matriz2 = eye(3,3); % matriz identidade (1 na diagonal principal)

result5 = matriz1 * matriz2;

%------------------------------------------------------
w = 1;
theta = 0;
t = (0:0.1:10);



senoide = sin (w*t + theta);



%plot(senoide);
%pause

##x = (0 : 0.1 : 10);
##y = sin(x);
##
##plot (y);
%-------------------------------------------------------

% Definindo os parâmetros
amplitude = 1;
frequencia = 2;
duracao = 1; % em segundos
taxa_amostragem = 1000; % em Hz
ruido_amplitude = 0.2;

% Criando o vetor de tempo
t = linspace(0, duracao, duracao * taxa_amostragem);

% Gerando o sinal de seno
sinal_seno = amplitude * sin(2 * pi * frequencia * t);

% Gerando o ruído
ruido = ruido_amplitude * randn(size(t));

% Adicionando ruído ao sinal de seno
sinal_com_ruido = sinal_seno + ruido;

%plot(t, sinal_com_ruido);
%-------------------------------------------------------

n_pontos = 10;                                          % Número de pontos vizinhos para calcular a média
sinal_filtrado = zeros(size(sinal_com_ruido));          % Inicializa com zeros vetor para sinal filtrado
                                                        %
for i = 1:length(sinal_com_ruido)                       % contador para alocar o sinal filtrado
    if i <= n_pontos                                    %
                                                        % Para os primeiros pontos, consideramos apenas os pontos disponíveis
        sinal_filtrado(i) = mean(sinal_com_ruido(1:i)); % guarda num ponto do vetor, a media aritmetica de um vetor
    else                                                %
                                                        % Para os pontos subsequentes, consideramos os pontos vizinhos
        sinal_filtrado(i) = mean(sinal_com_ruido(i-n_pontos:i));
    end
end

% Plotando o sinal original e o sinal filtrado
plot(t, sinal_com_ruido, 'b', t, sinal_filtrado, 'r');






%-------------------------------------------------------

