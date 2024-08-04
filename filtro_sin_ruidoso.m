%------------------------------------------------------------------
clc
clear
%---------------geração do sin ruidoso-----------------------------

t = linspace(0, 2, 1000);                                       % vetor que vai de 0 a 2 com 1000 divisoes
amplitude = 10;                                                 % amplitude do seno
amplitude_ruido = 3;                                            % amplitude do ruido
frequencia = 2;                                                 % frequencia do seno
                                                                %
                                                                %
sinal_seno = amplitude * sin(2 * pi * frequencia * t);          % A*sen(w*t)
ruido = amplitude_ruido * randn(size(t));                       % B*(valor aleatorio do vetor t)
                                                                %
sinal_com_ruido = sinal_seno + ruido;                           % sinal do seno mais o ruido (no mesmo ponto t)

%---------------filtro do sin ruidoso------------------------------

                                                                %
n_pontos = 10;                                                  % quantidades de pontos para media movel
sinal_filtrado = zeros(size(sinal_com_ruido));                  % vetor com zeros, do mesmo tamanho do sinal ruidoso
                                                                %
for i = 1:length(sinal_com_ruido)                               % contador para alocar o sinal filtrado
    if i <= n_pontos                                            % se a posição for menor que a quantidade de n_pontos
                                                                % consideramos apenas os pontos disponíveis
        sinal_filtrado(i) = mean(sinal_com_ruido(1:i));         % guarda num ponto do vetor, a media aritmetica de um vetor
    else                                                        % se a posição for maior que a quantidade de n_pontos
                                                                % Para os pontos subsequentes, consideramos os pontos vizinhos
        sinal_filtrado(i) = mean(sinal_com_ruido(i-n_pontos:i));% se a posição for a ultima, ele pega a media dos pontos anteriores
    end                                                         % EX: mean(sinal_com_ruido(20-10 : 20) --> faz a media de 10 ate 20 e guarda na posição 20
end                                                             % EX: mean(sinal_com_ruido(1000-10 : 1000) --> faz a media de 990 ate 1000 e guarda na posição 1000
                                                                %
plot(t, sinal_com_ruido, 'b', t, sinal_filtrado, 'r');          %

