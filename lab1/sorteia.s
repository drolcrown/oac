 .text

#Sorteia recupera o valor armazenado em s0 que representa a quantidade de Coordenadas que serão criadas
#e retorna o endereço para um vetor de  que será representado por sp.
MAIN:	
	li s0, 3 #simula o numero de items na lista
	li s1, 0 #s1 serve como o contador e é iniciado em 0
	slli t0, s0, 2
	sub sp ,sp, t0 #aloca memoria para pilha
SORTEIA:
	bge s1, s0, EXIT
	j GERAR_COORDENADA
GERAR_COORDENADA:
	#Mapear coordenadas X
	li a7, 41 #Gera um valor aleatorio que será usado para  a coordenada X e armazena em a0
	ecall
	li t2, 320 #Valor maximo para coordenadas X
	remu t2, a0, t2 #recupera o resto da divisão para certificar que o valor aleatorio gerado está no intervalo valido para as coordenadas X
	slli t2, t2, 16 # Desloca a palavra 16 bits a esquerda
	#Mapear coordenadas Y
	li a7, 41 #Gera um valor aleatorio que será usado para  a coordenada Y e armazena em a0
	ecall
	li t3, 240 #Valor maximo para coordenadas Y
	remu t3, a0, t3 #recupera o resto da divisão para certificar que o valor aleatorio gerado está no intervalo valido para as coordenadas Y
	slli t3, t3, 16 # Desloca a palavra 16 bits a esquerda
	srli t3, t3, 16 # Desloca a palavra 16 bits a direita para zerar os valores a esquerda no momento de fazer o OR
	or t4, t2 t3 # junta as coordenadas na palavra
	sw t4, (sp) # salva a coordenada em sp
	addi sp, sp, 4 #move sp para a proxima posicao na memoria
	addi s1, s1, 1 #incrementa o contador
	j SORTEIA
EXIT:
	add sp ,sp, t0 #esvazia a memoria alocada para pilha
	ret
	
	