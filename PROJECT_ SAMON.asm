include emu8086.inc


JMP frente                   ;variaveis iniciais, para as estatisticas de ambos os jogados
     hp_1 db 10              ;e tambem para controlos do jogo e controlos dos turnos
     hp_2 db 10
     atk_1 db 10
     atk_2 db 10
     velocidade_1 db 10
     velocidade_2 db 10 
     class_id db 1 
     DIRECAO db 0 
     ESCOLHA_PLAYER db 0
     TURN db 0
     DEFESA_P1 db 0
     DEFESA_P2 db 0
       
     DIREITA  EQU 4DH
     BAIXO    EQU 50H
     ESQUERDA EQU 4BH
     CIMA     EQU 48H
     ENTER    EQU 1CH
                            
frente:
        
    CALL CLEAR_SCREEN                           ;A funcao CLEAR_SCREEN limpa o ecran
    
    MOV TURN, 0 
                    
                       
    GOTOXY 35,12
    PRINT "BEM VINDO         "                  ; interface de boas vindas    
    GOTOXY 35,12
    PRINT "         "
    
    GOTOXY 25,12                                    ;interface de escolha de classe
    PRINT "Player 1 escolha uma classe:         "                       
    GOTOXY 25,12
    PRINT "                                     "
    
  
    
    gotoxy 0,8                                  ;desenha as linhas divisorias entre as classes
    MOV AH, 9
    LEA DX, linha_meio_grande 
    INT 21H
    
    gotoxy 0,17
    MOV AH, 9
    LEA DX, linha_meio_grande 
    INT 21H
       
    gotoxy 10,1                                ;classe ninja e as suas estatisticas
    MOV AH, 9
    LEA DX, class_ninja 
    INT 21H 
           
    gotoxy 25, 2
    MOV AH, 9
    LEA DX, vida
    INT 21h
    
    gotoxy 25, 3
    MOV AH, 9
    LEA DX, ataque
    INT 21h
    
    gotoxy 25, 4
    MOV AH, 9
    LEA DX, velocidade
    INT 21h
    
    GOTOXY 37,2                               ;muda a cor das barras e volta a colocar em branco depois
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1010b
    MOV CX, 10
    MOV AH, 9
    INT 10h
    MOV AH, 9
    LEA DX, barra_5
    INT 21h
    GOTOXY 37,2
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1111b
    MOV CX, 10
    MOV AH, 9 
    
    
    
    GOTOXY 37,3
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1100b
    MOV CX, 10
    MOV AH, 9
    INT 10h
    MOV AH, 9
    LEA DX, barra_2
    INT 21h
    GOTOXY 37,3
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1111b
    MOV CX, 10
    MOV AH, 9
    
    
    
    GOTOXY 37,4
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1110b
    MOV CX, 10
    MOV AH, 9
    INT 10h
    MOV AH, 9
    LEA DX, barra_7
    INT 21h
    GOTOXY 37,1
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1111b
    MOV CX, 10
    MOV AH, 9
    
    gotoxy 10,10                             ;mesmo processo da classe ninja mas para o tanque
    MOV AH, 9
    LEA DX, class_tank
    INT 21H
    
    gotoxy 25, 11
    MOV AH, 9
    LEA DX, vida
    INT 21h
    
    gotoxy 25, 12
    MOV AH, 9
    LEA DX, ataque
    INT 21h
    
    gotoxy 25, 13
    MOV AH, 9
    LEA DX, velocidade
    INT 21h
    
    GOTOXY 37,11
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1010b
    MOV CX, 10
    MOV AH, 9
    INT 10h
    MOV AH, 9
    LEA DX, barra_9
    INT 21h
    GOTOXY 37,11
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1111b
    MOV CX, 10
    MOV AH, 9 
    
    
    
    GOTOXY 37,12
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1100b
    MOV CX, 10
    MOV AH, 9
    INT 10h
    MOV AH, 9
    LEA DX, barra_2
    INT 21h
    GOTOXY 37,12
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1111b
    MOV CX, 10
    MOV AH, 9
    
    
    
    GOTOXY 37,13
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1110b
    MOV CX, 10
    MOV AH, 9
    INT 10h
    MOV AH, 9
    LEA DX, barra_2
    INT 21h
    GOTOXY 37,13
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1111b
    MOV CX, 10
    MOV AH, 9
    
    gotoxy 10,19
    MOV AH, 9                                  ;mesmo processo da classe ninja e tanque 
    LEA DX, class_warrior                      ;mas para o guerreiro
    INT 21h
    
    gotoxy 25, 20
    MOV AH, 9
    LEA DX, vida
    INT 21h
    
    gotoxy 25, 21
    MOV AH, 9
    LEA DX, ataque
    INT 21h
    
    gotoxy 25, 22
    MOV AH, 9
    LEA DX, velocidade
    INT 21h
    
    GOTOXY 37,20
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1010b
    MOV CX, 10
    MOV AH, 9
    INT 10h
    MOV AH, 9
    LEA DX, barra_7
    INT 21h
    GOTOXY 37,20
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1111b
    MOV CX, 10
    MOV AH, 9 
    
    
    
    GOTOXY 37,21
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1100b
    MOV CX, 10
    MOV AH, 9
    INT 10h
    MOV AH, 9
    LEA DX, barra_3
    INT 21h
    GOTOXY 37,21
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1111b
    MOV CX, 10
    MOV AH, 9
    
    
    
    GOTOXY 37,22
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1110b
    MOV CX, 10
    MOV AH, 9
    INT 10h
    MOV AH, 9
    LEA DX, barra_4
    INT 21h
    GOTOXY 37,12
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1111b
    MOV CX, 10
    MOV AH, 9  
    
    MOV ESCOLHA_PLAYER, 0  
    
ESCOLHA_CLASSE:

    MOV DIRECAO, 0      ;escolha de classe atraves das setas do teclado
    
MOV_NINJA:    
    
    CMP DIRECAO, 1
    JE ELIM1_TANK
    CMP DIRECAO, 2
    JE ELIM1_WARRIOR
    JMP ELIM1_FIM
    
ELIM1_TANK:

    GOTOXY 9, 10
    PUTC ' '
    JMP ELIM1_FIM
    
ELIM1_WARRIOR:
    
    GOTOXY 9, 19
    PUTC ' '
    JMP ELIM1_FIM
    
ELIM1_FIM:
    
    MOV DIRECAO, 0
    GOTOXY 9, 1
    PUTC '>'
    
    MOV AH, 00H
    INT 16H
    CMP AH, ENTER
    JE FIM_NINJA
    CMP AH, BAIXO
    JE MOV_TANK
    CMP AH, CIMA
    JE MOV_WARRIOR    
    
MOV_TANK:

    CMP DIRECAO, 0
    JE ELIM2_NINJA
    CMP DIRECAO, 2
    JE ELIM2_WARRIOR
    JMP ELIM2_FIM
    
ELIM2_NINJA:

    GOTOXY 9, 1
    PUTC ' '
    JMP ELIM2_FIM
    
ELIM2_WARRIOR:
    
    GOTOXY 9, 19
    PUTC ' '
    JMP ELIM2_FIM
    
ELIM2_FIM:
    
    MOV DIRECAO, 1
    GOTOXY 9, 10
    PUTC '>'
    
    MOV AH, 00H
    INT 16H
    CMP AH, ENTER
    JE FIM_TANK
    CMP AH, BAIXO
    JE MOV_WARRIOR
    CMP AH, CIMA
    JE MOV_NINJA
    
MOV_WARRIOR:

    CMP DIRECAO, 1
    JE ELIM3_TANK
    CMP DIRECAO, 0
    JE ELIM3_NINJA
    JMP ELIM3_FIM
    
ELIM3_TANK:

    GOTOXY 9, 10
    PUTC ' '
    JMP ELIM3_FIM
    
ELIM3_NINJA:
    
    GOTOXY 9, 1
    PUTC ' '
    JMP ELIM3_FIM
    
ELIM3_FIM:
    
    MOV DIRECAO, 2
    GOTOXY 9, 19
    PUTC '>'
    
    MOV AH, 00H
    INT 16H
    CMP AH, ENTER
    JE FIM_WARRIOR
    CMP AH, BAIXO
    JE MOV_NINJA
    CMP AH, CIMA
    JE MOV_TANK
               
FIM_NINJA:
    
    CMP ESCOLHA_PLAYER, 1
    JE ESCOLHA1_PLAYER2 
    
    MOV ESCOLHA_PLAYER, 1
    
    MOV class_id, 1 
    JMP FIM_ESCOLHA_PLAYER1
    
ESCOLHA1_PLAYER2:
    
    MOV class_id, 1
    JMP FIM_ESCOLHA_PLAYER2

FIM_TANK:
    
    CMP ESCOLHA_PLAYER, 1
    JE ESCOLHA2_PLAYER2
    
    MOV ESCOLHA_PLAYER, 1
    
    MOV class_id, 2 
    JMP FIM_ESCOLHA_PLAYER1
    
ESCOLHA2_PLAYER2:
    
    MOV class_id, 2
    JMP FIM_ESCOLHA_PLAYER2

FIM_WARRIOR:

    CMP ESCOLHA_PLAYER, 1
    JE ESCOLHA3_PLAYER2
    
    MOV ESCOLHA_PLAYER, 1
    
    MOV class_id, 3 
    JMP FIM_ESCOLHA_PLAYER1
    
ESCOLHA3_PLAYER2:
    
    MOV class_id, 3
    JMP FIM_ESCOLHA_PLAYER2
  
  
    FIM_ESCOLHA_PLAYER1:                                     ;atualizar estatisticas
        
    CALL CLEAR_SCREEN
    CMP class_id, 1
    JE class_change_ninja 
    
    CMP class_id, 2
    JE class_change_tank
    
    CMP class_id, 3
    JE class_change_warrior
    
    class_change_ninja:
    mov hp_1, 5
    mov atk_1, 2
    mov velocidade_1, 7
    jmp player2_class
    
    class_change_tank:
    mov hp_1, 9
    mov atk_1, 2
    mov velocidade_1, 2
    jmp player2_class
    
    class_change_warrior:
    mov hp_1, 7
    mov atk_1, 3
    mov velocidade_1, 4
    jmp player2_class
 
    
    player2_class:                                        ;mesmo processo do player 1
    GOTOXY 25,12
    PRINT "Player 2 escolha uma classe:         "                       
    GOTOXY 25,12
    PRINT "                                     "
    
  
    
    gotoxy 0,8
    MOV AH, 9
    LEA DX, linha_meio_grande 
    INT 21H
    
    gotoxy 0,17
    MOV AH, 9
    LEA DX, linha_meio_grande 
    INT 21H
       
    gotoxy 10,1
    MOV AH, 9
    LEA DX, class_ninja 
    INT 21H 
           
    gotoxy 25, 2
    MOV AH, 9
    LEA DX, vida
    INT 21h
    
    gotoxy 25, 3
    MOV AH, 9
    LEA DX, ataque
    INT 21h
    
    gotoxy 25, 4
    MOV AH, 9
    LEA DX, velocidade
    INT 21h
    
    GOTOXY 37,2
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1010b
    MOV CX, 10
    MOV AH, 9
    INT 10h
    MOV AH, 9
    LEA DX, barra_5
    INT 21h
    GOTOXY 37,2
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1111b
    MOV CX, 10
    MOV AH, 9 
    
    
    
    GOTOXY 37,3
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1100b
    MOV CX, 10
    MOV AH, 9
    INT 10h
    MOV AH, 9
    LEA DX, barra_2
    INT 21h
    GOTOXY 37,3
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1111b
    MOV CX, 10
    MOV AH, 9
    
    
    
    GOTOXY 37,4
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1110b
    MOV CX, 10
    MOV AH, 9
    INT 10h
    MOV AH, 9
    LEA DX, barra_7
    INT 21h
    GOTOXY 37,1
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1111b
    MOV CX, 10
    MOV AH, 9
    
    gotoxy 10,10
    MOV AH, 9
    LEA DX, class_tank
    INT 21H
    
    gotoxy 25, 11
    MOV AH, 9
    LEA DX, vida
    INT 21h
    
    gotoxy 25, 12
    MOV AH, 9
    LEA DX, ataque
    INT 21h
    
    gotoxy 25, 13
    MOV AH, 9
    LEA DX, velocidade
    INT 21h
    
    GOTOXY 37,11
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1010b
    MOV CX, 10
    MOV AH, 9
    INT 10h
    MOV AH, 9
    LEA DX, barra_9
    INT 21h
    GOTOXY 37,11
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1111b
    MOV CX, 10
    MOV AH, 9 
    
    
    
    GOTOXY 37,12
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1100b
    MOV CX, 10
    MOV AH, 9
    INT 10h
    MOV AH, 9
    LEA DX, barra_2
    INT 21h
    GOTOXY 37,12
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1111b
    MOV CX, 10
    MOV AH, 9
    
    
    
    GOTOXY 37,13
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1110b
    MOV CX, 10
    MOV AH, 9
    INT 10h
    MOV AH, 9
    LEA DX, barra_2
    INT 21h
    GOTOXY 37,13
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1111b
    MOV CX, 10
    MOV AH, 9
    
    gotoxy 10,19
    MOV AH, 9
    LEA DX, class_warrior
    INT 21h
    
    gotoxy 25, 20
    MOV AH, 9
    LEA DX, vida
    INT 21h
    
    gotoxy 25, 21
    MOV AH, 9
    LEA DX, ataque
    INT 21h
    
    gotoxy 25, 22
    MOV AH, 9
    LEA DX, velocidade
    INT 21h
    
    GOTOXY 37,20
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1010b
    MOV CX, 10
    MOV AH, 9
    INT 10h
    MOV AH, 9
    LEA DX, barra_7
    INT 21h
    GOTOXY 37,20
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1111b
    MOV CX, 10
    MOV AH, 9 
    
    
    
    GOTOXY 37,21
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1100b
    MOV CX, 10
    MOV AH, 9
    INT 10h
    MOV AH, 9
    LEA DX, barra_3
    INT 21h
    GOTOXY 37,21
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1111b
    MOV CX, 10
    MOV AH, 9
    
    
    
    GOTOXY 37,22
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1110b
    MOV CX, 10
    MOV AH, 9
    INT 10h
    MOV AH, 9
    LEA DX, barra_4
    INT 21h
    GOTOXY 37,12
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1111b
    MOV CX, 10
    MOV AH, 9 
    
    JMP ESCOLHA_CLASSE
        
    
FIM_ESCOLHA_PLAYER2:
        
    CALL CLEAR_SCREEN 
    
    CMP class_id, 1
    JE class_change_ninja_2 
    
    CMP class_id, 2
    JE class_change_tank_2
    
    CMP class_id, 3
    JE class_change_warrior_2
    
    class_change_ninja_2:
    mov hp_2, 5
    mov atk_2, 2
    mov velocidade_2, 7
    jmp player2_class_done
    
    class_change_tank_2:
    mov hp_2, 9
    mov atk_2, 2
    mov velocidade_2, 2
    jmp player2_class_done
    
    class_change_warrior_2:
    mov hp_2, 7
    mov atk_2, 3
    mov velocidade_2, 4
    jmp player2_class_done
    
    player2_class_done:
    
    
    
                                
    ;interface do jogo
    
    ;INT 10h / AH = 09h - write character and attribute at cursor position.

    ;input:
    ;AL = character to display.
    ;BH = page number.
    ;BL = attribute.
    ;CX = number of times to write character.
        
    GOTOXY 63,13
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1010b
    MOV CX, 10
    MOV AH, 9
    INT 10h
    
    GOTOXY 12,8
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1010b
    MOV CX, 10
    MOV AH, 9
    INT 10h
    
    GOTOXY 63,14
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1100b
    MOV CX, 10
    MOV AH, 9
    INT 10h
    
    GOTOXY 12,9
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1100b
    MOV CX, 10
    MOV AH, 9
    INT 10h
    
    GOTOXY 63,15
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1110b
    MOV CX, 10
    MOV AH, 9
    INT 10h 
    
    GOTOXY 12,10
    MOV AL, 20h
    MOV BH, 0
    MOV BL, 0000_1110b
    MOV CX, 10
    MOV AH, 9
    INT 10h 
    
    
  
    gotoxy 0,0            
    
                             ;quadrado para os moves do player de cima
    MOV AH,9                 ;desenha a linha superior
    LEA DX,linha_superior
    INT 21H
    
    MOV CX, 4                ;MOV CX, 4 pois e' a altura do quadrado
    
REPETIR:                     ;loop que repete 4 vezes
                             ;desenha linhas do meio
    MOV AH,9
    LEA DX, linha_meio
    INT 21H
    
    LOOP REPETIR
    
    MOV AH,9                   ;desenha linha inferior
    LEA DX,linha_inferior
    INT 21H 
    
    GOTOXY 32,4
    print 'Player 2' 
    
    GOTOXY 2,1              ;escreve no ecra os 4 moves disponiveis ao player de cima
    MOV AH,9
    LEA DX, ataque
    INT 21h    
    
    GOTOXY 2,4
    MOV AH,9
    LEA DX, defesa
    INT 21h   
    
    GOTOXY 10,1
    MOV AH,9
    LEA DX, quick
    INT 21h   
    
    GOTOXY 10,4
    MOV AH,9
    LEA DX, risestats
    INT 21h
    
    GOTOXY 4,6               ;escreve no ecra as 4 estatisticas do player de cima
    PRINT 'ESTATISTICAS:'
     
    GOTOXY 1,8
    PRINT 'VIDA' 
    
    GOTOXY 1,9
    PRINT 'ATAQUE' 
    
    GOTOXY 1,10
    PRINT 'VELOCIDADE' 
  
    GOTOXY 48,18            
                            
    MOV AH,9                ;funciona igual ao player de cima mas agora em baixo
    LEA DX,linha_superior
    INT 21H
    
    GOTOXY 48,19
    
    MOV AH,9
    LEA DX,linha_meio
    INT 21H
    GOTOXY 48,20
    
    MOV AH,9
    LEA DX,linha_meio
    INT 21H
    GOTOXY 48,21
    
    MOV AH,9
    LEA DX,linha_meio
    INT 21H
    GOTOXY 48,22
    
    MOV AH,9
    LEA DX,linha_meio
    INT 21H
    GOTOXY 48,23
    
    MOV AH,9
    LEA DX,linha_inferior
    INT 21H 
    
    GOTOXY 40,22
    print 'Player 1' 
    
    GOTOXY 50,19                  ;moves dos player de baixo
    MOV AH,9
    LEA DX, ataque
    INT 21h 
    
    GOTOXY 50,22
     MOV AH,9
    LEA DX, defesa
    INT 21h 
    
    GOTOXY 58,19
    MOV AH,9
    LEA DX, quick
    INT 21h  
    
    GOTOXY 58,22
    MOV AH,9
    LEA DX, risestats
    INT 21h
    
    
    
    GOTOXY 52,11
    PRINT 'ESTATISTICAS:'        ;estatisticas do player de baixo 
    
    GOTOXY 52,13
    PRINT 'VIDA'  
    
    GOTOXY 52,14
    PRINT 'ATAQUE'
         
    GOTOXY 52,15
    PRINT 'VELOCIDADE' 
                                 ;interface atualizavel 
    
    MOV BH, velocidade_2
    CMP velocidade_1, BH
    JGE TURN_GREATER 
    JMP TURN_LOWER
    
TURN_GREATER:
    
    MOV TURN, 0
    JMP TURN_FRENTE
    
TURN_LOWER:
    
    MOV TURN, 1
    
TURN_FRENTE:                                 
    
UPDATE_STATS: 
   
    CMP hp_1, 10
    JE printHP_1_10
    
    CMP hp_1, 9
    JE printHP_1_9
    
    CMP hp_1, 8
    JE printHP_1_8
    
    CMP hp_1, 7
    JE printHP_1_7
    
    CMP hp_1, 6
    JE printHP_1_6
    
    CMP hp_1, 5
    JE printHP_1_5
    
    CMP hp_1, 4
    JE printHP_1_4
    
    CMP hp_1, 3
    JE printHP_1_3
    
    CMP hp_1, 2
    JE printHP_1_2
    
    CMP hp_1, 1
    JE printHP_1_1
    
    CMP hp_1, 0
    JLE printHP_1_0
    
    
    printHP_1_10:        
    GOTOXY 63,13
    MOV AH,9
    LEA DX, barra_cheia
    INT 21h
    JMP printHP1_done
    
    printHP_1_9: 
    GOTOXY 63,13
    MOV AH,9
    LEA DX, barra_9
    INT 21h 
    JMP printHP1_done
    
    printHP_1_8: 
    
    GOTOXY 63,13
    MOV AH,9
    LEA DX, barra_8
    INT 21h 
    JMP printHP1_done
    
    printHP_1_7: 
    GOTOXY 63,13
    MOV AH,9
    LEA DX, barra_7
    INT 21h
    JMP printHP1_done
    
    printHP_1_6: 
    
    GOTOXY 63,13
    MOV AH,9
    LEA DX, barra_6
    INT 21h
    JMP printHP1_done
    
    printHP_1_5: 
    GOTOXY 63,13
    MOV AH,9
    LEA DX, barra_5
    INT 21h
    JMP printHP1_done
    
    printHP_1_4: 
    
    GOTOXY 63,13
    MOV AH,9
    LEA DX, barra_4
    INT 21h
    JMP printHP1_done
    
    printHP_1_3: 
    GOTOXY 63,13
    MOV AH,9
    LEA DX, barra_3
    INT 21h
    JMP printHP1_done
    
    printHP_1_2: 
    
    GOTOXY 63,13
    MOV AH,9
    LEA DX, barra_2
    INT 21h
    JMP printHP1_done
    
    printHP_1_1: 
    GOTOXY 63,13
    MOV AH,9
    LEA DX, barra_1
    INT 21h
    JMP printHP1_done
    
    printHP_1_0: 
    GOTOXY 63,13
    MOV AH,9
    LEA DX, barra_0
    INT 21h
    JMP printHP1_done
    
    
    printHP1_done:
    
    CMP hp_2, 10
    JE printHP_2_10
    
    CMP hp_2, 9
    JE printHP_2_9
    
    CMP hp_2, 8
    JE printHP_2_8
    
    CMP hp_2, 7
    JE printHP_2_7
    
    CMP hp_2, 6
    JE printHP_2_6
    
    CMP hp_2, 5
    JE printHP_2_5
    
    CMP hp_2, 4
    JE printHP_2_4
    
    CMP hp_2, 3
    JE printHP_2_3
    
    CMP hp_2, 2
    JE printHP_2_2
    
    CMP hp_2, 1
    JE printHP_2_1
    
    CMP hp_2, 0
    JLE printHP_2_0 
    
    
    printHP_2_10: 
    
    GOTOXY 12,8
    MOV AH,9
    LEA DX, barra_cheia
    INT 21h
    JMP printHP2_done 
    
    printHP_2_9: 
    
    GOTOXY 12,8
    MOV AH,9
    LEA DX, barra_9
    INT 21h
    JMP printHP2_done
    
    printHP_2_8: 
    
    GOTOXY 12,8
    MOV AH,9
    LEA DX, barra_8
    INT 21h
    JMP printHP2_done 
    
    printHP_2_7: 
    
    GOTOXY 12,8
    MOV AH,9
    LEA DX, barra_7
    INT 21h
    JMP printHP2_done
    
    printHP_2_6: 
    
    GOTOXY 12,8
    MOV AH,9
    LEA DX, barra_6
    INT 21h
    JMP printHP2_done 
    
    printHP_2_5: 
    
    GOTOXY 12,8
    MOV AH,9
    LEA DX, barra_5
    INT 21h
    JMP printHP2_done
    
    printHP_2_4: 
    
    GOTOXY 12,8
    MOV AH,9
    LEA DX, barra_4
    INT 21h
    JMP printHP2_done 
    
    printHP_2_3: 
    
    GOTOXY 12,8
    MOV AH,9
    LEA DX, barra_3
    INT 21h
    JMP printHP2_done
    
    printHP_2_2: 
    
    GOTOXY 12,8
    MOV AH,9
    LEA DX, barra_2
    INT 21h
    JMP printHP2_done
    
    printHP_2_1: 
    
    GOTOXY 12,8
    MOV AH,9
    LEA DX, barra_1
    INT 21h
    JMP printHP2_done
    
    printHP_2_0: 
    
    GOTOXY 12,8
    MOV AH,9
    LEA DX, barra_0
    INT 21h
    JMP printHP2_done 
    
    
    printHP2_done:
    
    CMP atk_1, 10
    JE printATK_1_10
    
    CMP atk_1, 9
    JE printATK_1_9
    
    CMP atk_1, 8
    JE printATK_1_8
    
    CMP atk_1, 7
    JE printATK_1_7
    
    CMP atk_1, 6
    JE printATK_1_6
    
    CMP atk_1, 5
    JE printATK_1_5
    
    CMP atk_1, 4
    JE printATK_1_4
    
    CMP atk_1, 3
    JE printATK_1_3
    
    CMP atk_1, 2
    JE printATK_1_2
    
    CMP atk_1, 1
    JE printATK_1_1 
    
    CMP atk_1, 0
    JLE printATK_1_0
    
    
    printATK_1_10:
    
    GOTOXY 63,14
    MOV AH,9
    LEA DX, barra_cheia
    INT 21h
    JMP printATK_1_done
    
    printATK_1_9:
    
    GOTOXY 63,14
    MOV AH,9
    LEA DX, barra_9
    INT 21h
    JMP printATK_1_done
    
    printATK_1_8:
    
    GOTOXY 63,14
    MOV AH,9
    LEA DX, barra_8
    INT 21h
    JMP printATK_1_done
    
    printATK_1_7:
    
    GOTOXY 63,14
    MOV AH,9
    LEA DX, barra_7
    INT 21h
    JMP printATK_1_done
    
    printATK_1_6:
    
    GOTOXY 63,14
    MOV AH,9
    LEA DX, barra_6
    INT 21h
    JMP printATK_1_done
    
    printATK_1_5:
    
    GOTOXY 63,14
    MOV AH,9
    LEA DX, barra_5
    INT 21h
    JMP printATK_1_done
    
    printATK_1_4:
    
    GOTOXY 63,14
    MOV AH,9
    LEA DX, barra_4
    INT 21h
    JMP printATK_1_done
    
    printATK_1_3:
    
    GOTOXY 63,14
    MOV AH,9
    LEA DX, barra_3
    INT 21h
    JMP printATK_1_done
    
    printATK_1_2:
    
    GOTOXY 63,14
    MOV AH,9
    LEA DX, barra_2
    INT 21h
    JMP printATK_1_done
    
    printATK_1_1:
    
    GOTOXY 63,14
    MOV AH,9
    LEA DX, barra_1
    INT 21h
    JMP printATK_1_done
    
    printATK_1_0:
    
    GOTOXY 63,14
    MOV AH,9
    LEA DX, barra_0
    INT 21h
    JMP printATK_1_done
     
    printATK_1_done:
    
        
    CMP atk_2, 10
    JE printATK_2_10
    
    CMP atk_2, 9
    JE printATK_2_9
    
    CMP atk_2, 8
    JE printATK_2_8
    
    CMP atk_2, 7
    JE printATK_2_7
    
    CMP atk_2, 6
    JE printATK_2_6
    
    CMP atk_2, 5
    JE printATK_2_5
    
    CMP atk_2, 4
    JE printATK_2_4
    
    CMP atk_2, 3
    JE printATK_2_3
    
    CMP atk_2, 2
    JE printATK_2_2
    
    CMP atk_2, 1
    JE printATK_2_1 
    
    CMP atk_2, 0
    JLE printATK_2_0
    
    
    printATK_2_10:
    
    GOTOXY 12,9
    MOV AH,9
    LEA DX, barra_cheia
    INT 21h
    JMP printATK_2_done
    
    printATK_2_9:
    
    GOTOXY 12,9
    MOV AH,9
    LEA DX, barra_9
    INT 21h
    JMP printATK_2_done
    
    printATK_2_8:
    
    GOTOXY 12,9
    MOV AH,9
    LEA DX, barra_8
    INT 21h
    JMP printATK_2_done
    
    printATK_2_7:
    
    GOTOXY 12,9
    MOV AH,9
    LEA DX, barra_7
    INT 21h
    JMP printATK_2_done
    
    printATK_2_6:
    
    GOTOXY 12,9
    MOV AH,9
    LEA DX, barra_6
    INT 21h
    JMP printATK_2_done
    
    printATK_2_5:
    
    GOTOXY 12,9
    MOV AH,9
    LEA DX, barra_5
    INT 21h
    JMP printATK_2_done
    
    printATK_2_4:
    
    GOTOXY 12,9
    MOV AH,9
    LEA DX, barra_4
    INT 21h
    JMP printATK_2_done
    
    printATK_2_3:
    
    GOTOXY 12,9
    MOV AH,9
    LEA DX, barra_3
    INT 21h
    JMP printATK_2_done
    
    printATK_2_2:
    
    GOTOXY 12,9
    MOV AH,9
    LEA DX, barra_2
    INT 21h
    JMP printATK_2_done
    
    printATK_2_1:
               
    GOTOXY 12,9
    MOV AH,9
    LEA DX, barra_1
    INT 21h
    JMP printATK_2_done
    
    printATK_2_0:
    
    GOTOXY 12,9
    MOV AH,9
    LEA DX, barra_0
    INT 21h
    JMP printATK_2_done
    
    printATK_2_done:
    
    CMP velocidade_1, 10
    JE printSPEED_1_10
    
    CMP velocidade_1, 9
    JE printSPEED_1_9
    
    CMP velocidade_1, 8
    JE printSPEED_1_8
    
    CMP velocidade_1, 7
    JE printSPEED_1_7
    
    CMP velocidade_1, 6
    JE printSPEED_1_6
    
    CMP velocidade_1, 5
    JE printSPEED_1_5
    
    CMP velocidade_1, 4
    JE printSPEED_1_4
    
    CMP velocidade_1, 3
    JE printSPEED_1_3
    
    CMP velocidade_1, 2
    JE printSPEED_1_2
    
    CMP velocidade_1, 1
    JE printSPEED_1_1 
    
    CMP velocidade_1, 0
    JE printSPEED_1_0
    
    
    printSPEED_1_10:
    
    GOTOXY 63,15
    MOV AH,9
    LEA DX, barra_cheia
    INT 21h
    JMP printSPEED_1_done
    
    printSPEED_1_9:
    
    GOTOXY 63,15
    MOV AH,9
    LEA DX, barra_9
    INT 21h
    JMP printSPEED_1_done
    
    printSPEED_1_8:
    
    GOTOXY 63,15
    MOV AH,9
    LEA DX, barra_8
    INT 21h
    JMP printSPEED_1_done
    
    printSPEED_1_7:
    
    GOTOXY 63,15
    MOV AH,9
    LEA DX, barra_7
    INT 21h
    JMP printSPEED_1_done
    
    printSPEED_1_6:
    
    GOTOXY 63,15
    MOV AH,9
    LEA DX, barra_6
    INT 21h
    JMP printSPEED_1_done
    
    printSPEED_1_5:
             
    GOTOXY 63,15
    MOV AH,9
    LEA DX, barra_5
    INT 21h
    JMP printSPEED_1_done
    
    printSPEED_1_4:
    
    GOTOXY 63,15
    MOV AH,9
    LEA DX, barra_4
    INT 21h
    JMP printSPEED_1_done
    
    printSPEED_1_3:
    
    GOTOXY 63,15
    MOV AH,9
    LEA DX, barra_3
    INT 21h
    JMP printSPEED_1_done
    
    printSPEED_1_2:
    
    GOTOXY 63,15
    MOV AH,9
    LEA DX, barra_2
    INT 21h
    JMP printSPEED_1_done
    
    printSPEED_1_1:
    
    GOTOXY 63,15
    MOV AH,9
    LEA DX, barra_1
    INT 21h
    JMP printSPEED_1_done
    
    printSPEED_1_0:
    
    GOTOXY 63,15
    MOV AH,9
    LEA DX, barra_0
    INT 21h
    JMP printSPEED_1_done
     
    printSPEED_1_done:
    
    CMP velocidade_2, 10
    JE printSPEED_2_10
    
    CMP velocidade_2, 9
    JE printSPEED_2_9
    
    CMP velocidade_2, 8
    JE printSPEED_2_8
    
    CMP velocidade_2, 7
    JE printSPEED_2_7
    
    CMP velocidade_2, 6
    JE printSPEED_2_6
    
    CMP velocidade_2, 5
    JE printSPEED_2_5
    
    CMP velocidade_2, 4
    JE printSPEED_2_4
    
    CMP velocidade_2, 3
    JE printSPEED_2_3
    
    CMP velocidade_2, 2
    JE printSPEED_2_2
    
    CMP velocidade_2, 1
    JE printSPEED_2_1 
    
    CMP velocidade_2, 0
    JE printSPEED_2_0
    
    
    printSPEED_2_10:
    
    GOTOXY 12,10
    MOV AH,9
    LEA DX, barra_cheia
    INT 21h
    JMP printSPEED_2_done
    
    printSPEED_2_9:
    
    GOTOXY 12,10
    MOV AH,9
    LEA DX, barra_9
    INT 21h
    JMP printSPEED_2_done
    
    printSPEED_2_8:
    
    GOTOXY 12,10
    MOV AH,9
    LEA DX, barra_8
    INT 21h
    JMP printSPEED_2_done
    
    printSPEED_2_7:
    
    GOTOXY 12,10
    MOV AH,9
    LEA DX, barra_7
    INT 21h
    JMP printSPEED_2_done
    
    printSPEED_2_6:
    
    GOTOXY 12,10
    MOV AH,9
    LEA DX, barra_6
    INT 21h
    JMP printSPEED_2_done
    
    printSPEED_2_5:
             
    GOTOXY 12,10
    MOV AH,9
    LEA DX, barra_5
    INT 21h
    JMP printSPEED_2_done
    
    printSPEED_2_4:
    
    GOTOXY 12,10
    MOV AH,9
    LEA DX, barra_4
    INT 21h
    JMP printSPEED_2_done
    
    printSPEED_2_3:
    
    GOTOXY 12,10
    MOV AH,9
    LEA DX, barra_3
    INT 21h
    JMP printSPEED_2_done
    
    printSPEED_2_2:
    
    GOTOXY 12,10
    MOV AH,9
    LEA DX, barra_2
    INT 21h
    JMP printSPEED_2_done
    
    printSPEED_2_1:
    
    GOTOXY 12,10
    MOV AH,9
    LEA DX, barra_1
    INT 21h
    JMP printSPEED_2_done
    
    printSPEED_2_0:
    
    GOTOXY 12,10
    MOV AH,9
    LEA DX, barra_0
    INT 21h
    JMP printSPEED_2_done
    
    printSPEED_2_done:  
    
    CMP hp_1, 0
    JLE WIN_P2
    
    CMP hp_2, 0
    JLE WIN_P1
    
    
    CMP TURN, 1
    JE TURN_P2  
    
    MOV TURN, 1
    
    mov direcao, 0  
    
MOVS_ATAQUE2:                           ;escolha dos ataques atraves das setas
    
    CMP DIRECAO, 1
    JE  ELIM1_DEFESA2
    CMP DIRECAO, 2
    JE  ELIM1_QUICK2
    CMP DIRECAO, 3
    JE  ELIM1_STATS2
    JMP ELIM1_END2

ELIM1_DEFESA2:
    
    GOTOXY 49, 22
    PUTC ' ' 
    JMP ELIM1_END2 
    
ELIM1_QUICK2:
    
    GOTOXY 57, 19
    PUTC ' ' 
    JMP ELIM1_END2
    
ELIM1_STATS2:
    
    GOTOXY 57, 22
    PUTC ' ' 
    JMP ELIM1_END2 
    
ELIM1_END2:
     
    MOV DIRECAO, 0 
    GOTOXY 49,19
    PUTC '>'

    MOV AH, 00H
    INT 16H 
    CMP AH, ENTER 
    JE  FIM_ATAQUE2
    CMP AH, BAIXO
    JE  MOVS_DEFESA2
    CMP AH, CIMA
    JE  MOVS_DEFESA2
    CMP AH, DIREITA
    JE MOVS_QUICK2
    CMP AH, ESQUERDA
    JE MOVS_QUICK2 
    

MOVS_DEFESA2:
   
    CMP DIRECAO, 0
    JE  ELIM2_ATAQUE2
    CMP DIRECAO, 2
    JE  ELIM2_QUICK2
    CMP DIRECAO, 3
    JE  ELIM2_STATS2

ELIM2_ATAQUE2:
    
    GOTOXY 49, 19
    PUTC ' ' 
    JMP ELIM2_END2 
    
ELIM2_QUICK2:
    
    GOTOXY 57, 19
    PUTC ' ' 
    JMP ELIM2_END2
    
ELIM2_STATS2:
    
    GOTOXY 57, 22
    PUTC ' ' 
    JMP ELIM2_END2 
    
ELIM2_END2:
     
    MOV DIRECAO, 1 
    GOTOXY 49,22
    PUTC '>'

    MOV AH, 00H
    INT 16H 
    CMP AH, ENTER 
    JE  FIM_DEFESA2
    CMP AH, BAIXO
    JE  MOVS_ATAQUE2
    CMP AH, CIMA
    JE  MOVS_ATAQUE2
    CMP AH, DIREITA
    JE MOVS_STATS2
    CMP AH, ESQUERDA
    JE MOVS_STATS2
    

MOVS_QUICK2:

    CMP DIRECAO, 1
    JE  ELIM3_DEFESA2
    CMP DIRECAO, 0
    JE  ELIM3_ATAQUE2
    CMP DIRECAO, 3
    JE  ELIM3_STATS2

ELIM3_DEFESA2:
    
    GOTOXY 49, 22
    PUTC ' ' 
    JMP ELIM3_END2 
    
ELIM3_ATAQUE2:
    
    GOTOXY 49, 19
    PUTC ' ' 
    JMP ELIM3_END2
    
ELIM3_STATS2:
    
    GOTOXY 57, 22
    PUTC ' ' 
    JMP ELIM3_END2 
    
ELIM3_END2:
     
    MOV DIRECAO, 2 
    GOTOXY 57,19
    PUTC '>'

    MOV AH, 00H
    INT 16H 
    CMP AH, ENTER 
    JE  FIM_QUICK2
    CMP AH, BAIXO
    JE  MOVS_STATS2
    CMP AH, CIMA
    JE  MOVS_STATS2
    CMP AH, DIREITA
    JE MOVS_ATAQUE2
    CMP AH, ESQUERDA
    JE MOVS_ATAQUE2
    
MOVS_STATS2:

    CMP DIRECAO, 1
    JE  ELIM4_DEFESA2
    CMP DIRECAO, 2
    JE  ELIM4_QUICK2
    CMP DIRECAO, 0
    JE  ELIM4_ATAQUE2

ELIM4_DEFESA2:
    
    GOTOXY 49, 22
    PUTC ' ' 
    JMP ELIM4_END2 
    
ELIM4_QUICK2:
    
    GOTOXY 57, 19
    PUTC ' ' 
    JMP ELIM4_END2
    
ELIM4_ATAQUE2:
    
    GOTOXY 49, 19
    PUTC ' ' 
    JMP ELIM4_END2 
    
ELIM4_END2:
     
    MOV DIRECAO, 3 
    GOTOXY 57,22
    PUTC '>'

    MOV AH, 00H
    INT 16H 
    CMP AH, ENTER 
    JE  FIM_STATS2
    CMP AH, BAIXO
    JE  MOVS_QUICK2
    CMP AH, CIMA
    JE  MOVS_QUICK2
    CMP AH, DIREITA
    JE MOVS_DEFESA2
    CMP AH, ESQUERDA
    JE MOVS_DEFESA2
    
FIM_ATAQUE2:
    GOTOXY 49, 19
    PUTC ' ' 
    
    CMP DEFESA_P2, 0
    JE ATK_FRENTE1 
    
    MOV DEFESA_P2, 0
    JMP ATK_FIM1
     
ATK_FRENTE1: 
    MOV BH, atk_1
    SUB hp_2, BH
    
ATK_FIM1:
    
    JMP UPDATE_STATS   
        
FIM_DEFESA2:
    GOTOXY 49, 22
    PUTC ' '
    
    MOV DEFESA_P1, 1  
    
    
    JMP UPDATE_STATS

FIM_QUICK2:
    GOTOXY 57, 19
    PUTC ' '  
    
    INC HP_1
    
    JMP UPDATE_STATS

FIM_STATS2:
    GOTOXY 57, 22
    PUTC ' '
    
    INC ATK_1
    
    JMP UPDATE_STATS



TURN_P2:

    MOV TURN, 0
    
    mov direcao, 0   
MOVS_ATAQUE:
    
    CMP DIRECAO, 1
    JE  ELIM1_DEFESA
    CMP DIRECAO, 2
    JE  ELIM1_QUICK
    CMP DIRECAO, 3
    JE  ELIM1_STATS
    JMP ELIM1_END

ELIM1_DEFESA:
    
    GOTOXY 1, 4
    PUTC ' ' 
    JMP ELIM1_END 
    
ELIM1_QUICK:
    
    GOTOXY 9, 1
    PUTC ' ' 
    JMP ELIM1_END
    
ELIM1_STATS:
    
    GOTOXY 9, 4
    PUTC ' ' 
    JMP ELIM1_END 
    
ELIM1_END:
     
    MOV DIRECAO, 0 
    GOTOXY 1,1
    PUTC '>'

    MOV AH, 00H
    INT 16H 
    CMP AH, ENTER 
    JE  FIM_ATAQUE
    CMP AH, BAIXO
    JE  MOVS_DEFESA
    CMP AH, CIMA
    JE  MOVS_DEFESA
    CMP AH, DIREITA
    JE MOVS_QUICK
    CMP AH, ESQUERDA
    JE MOVS_QUICK 
    

MOVS_DEFESA:
   
    CMP DIRECAO, 0
    JE  ELIM2_ATAQUE
    CMP DIRECAO, 2
    JE  ELIM2_QUICK
    CMP DIRECAO, 3
    JE  ELIM2_STATS

ELIM2_ATAQUE:
    
    GOTOXY 1, 1
    PUTC ' ' 
    JMP ELIM2_END 
    
ELIM2_QUICK:
    
    GOTOXY 9, 1
    PUTC ' ' 
    JMP ELIM2_END
    
ELIM2_STATS:
    
    GOTOXY 9, 4
    PUTC ' ' 
    JMP ELIM2_END 
    
ELIM2_END:
     
    MOV DIRECAO, 1 
    GOTOXY 1,4
    PUTC '>'

    MOV AH, 00H
    INT 16H 
    CMP AH, ENTER 
    JE  FIM_DEFESA
    CMP AH, BAIXO
    JE  MOVS_ATAQUE
    CMP AH, CIMA
    JE  MOVS_ATAQUE
    CMP AH, DIREITA
    JE MOVS_STATS
    CMP AH, ESQUERDA
    JE MOVS_STATS
    

MOVS_QUICK:

    CMP DIRECAO, 1
    JE  ELIM3_DEFESA
    CMP DIRECAO, 0
    JE  ELIM3_ATAQUE
    CMP DIRECAO, 3
    JE  ELIM3_STATS

ELIM3_DEFESA:
    
    GOTOXY 1, 4
    PUTC ' ' 
    JMP ELIM3_END 
    
ELIM3_ATAQUE:
    
    GOTOXY 1, 1
    PUTC ' ' 
    JMP ELIM3_END
    
ELIM3_STATS:
    
    GOTOXY 9, 4
    PUTC ' ' 
    JMP ELIM3_END 
    
ELIM3_END:
     
    MOV DIRECAO, 2 
    GOTOXY 9,1
    PUTC '>'

    MOV AH, 00H
    INT 16H 
    CMP AH, ENTER 
    JE  FIM_QUICK
    CMP AH, BAIXO
    JE  MOVS_STATS
    CMP AH, CIMA
    JE  MOVS_STATS
    CMP AH, DIREITA
    JE MOVS_ATAQUE
    CMP AH, ESQUERDA
    JE MOVS_ATAQUE
    
MOVS_STATS:

    CMP DIRECAO, 1
    JE  ELIM4_DEFESA
    CMP DIRECAO, 2
    JE  ELIM4_QUICK
    CMP DIRECAO, 0
    JE  ELIM4_ATAQUE

ELIM4_DEFESA:
    
    GOTOXY 1, 4
    PUTC ' ' 
    JMP ELIM4_END 
    
ELIM4_QUICK:
    
    GOTOXY 9, 1
    PUTC ' ' 
    JMP ELIM4_END
    
ELIM4_ATAQUE:
    
    GOTOXY 1, 1
    PUTC ' ' 
    JMP ELIM4_END 
    
ELIM4_END:
     
    MOV DIRECAO, 3 
    GOTOXY 9,4
    PUTC '>'

    MOV AH, 00H
    INT 16H 
    CMP AH, ENTER 
    JE  FIM_STATS:
    CMP AH, BAIXO
    JE  MOVS_QUICK
    CMP AH, CIMA
    JE  MOVS_QUICK
    CMP AH, DIREITA
    JE MOVS_DEFESA
    CMP AH, ESQUERDA
    JE MOVS_DEFESA
    
FIM_ATAQUE:
    GOTOXY 1, 1
    PUTC ' ' 
    
    CMP DEFESA_P1, 0
    JE ATK_FRENTE2 
    
    MOV DEFESA_P1, 0
    JMP ATK_FIM2
     
ATK_FRENTE2:
    MOV BH, atk_2 
    SUB hp_1, BH
    
ATK_FIM2:  
       
    JMP UPDATE_STATS   
        
FIM_DEFESA:
    GOTOXY 1, 4
    PUTC ' ' 
    
    MOV DEFESA_P2, 1
    
    JMP UPDATE_STATS

FIM_QUICK:
    GOTOXY 9, 1
    PUTC ' '  
    
    INC hp_2
    
    JMP UPDATE_STATS

FIM_STATS:
    GOTOXY 9, 4
    PUTC ' ' 
    
    INC atk_2
    
    JMP UPDATE_STATS 

      
     
      
WIN_P1:
                                                           ;tela final

    CALL CLEAR_SCREEN 

    gotoxy 25,10
    print 'Parabens, Player 1 venceu !!!'     
    gotoxy 25,10
    print '                             '
    gotoxy 25,10
    print 'Desejam jogar novamente?(Y/N)'
    MOV AH, 1
    INT 21h

    CMP AL, 59h
    JE frente
    CMP AL, 79h
    JE frente
    CMP AL, 4Eh
    JE FIMMM
    CMP AL, 6Eh
    JE FIMMM

WIN_P2:


    CALL CLEAR_SCREEN

    gotoxy 25,10
    print 'Parabens, Player 2 venceu !!!'     
    gotoxy 25,10
    print '                             '
    gotoxy 25,10
    print 'Desejam jogar novamente?(Y/N)'
    MOV AH, 1
    INT 21h

    CMP AL, 59h
    JE frente
    CMP AL, 79h
    JE frente
    CMP AL, 4Eh
    JE FIMMM
    CMP AL, 6Eh
    JE FIMMM


    CALL CLEAR_SCREEN  
       
    
FIMMM:

    
    DEFINE_CLEAR_SCREEN
       
    
    RET 

linha_superior DB 0DAh,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,,0BFh,13,10, '$' 

linha_meio DB 0B3h,'                              ',0B3h, 13,10,'$'

linha_inferior DB 0C0h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0C4h,0D9h, '$'

barra_cheia db 0B2h,0B2h,0B2h,0B2h,0B2h,0B2h,0B2h,0B2h,0B2h,0B2h,'$'

barra_9 db 0B2h,0B2h,0B2h,0B2h,0B2h,0B2h,0B2h,0B2h,0B2h,' $' 

barra_8 db 0B2h,0B2h,0B2h,0B2h,0B2h,0B2h,0B2h,0B2h,'  $'

barra_7 db 0B2h,0B2h,0B2h,0B2h,0B2h,0B2h,0B2h,'   $'

barra_6 db 0B2h,0B2h,0B2h,0B2h,0B2h,0B2h,'    $'

barra_5 db 0B2h,0B2h,0B2h,0B2h,0B2h,'     $'

barra_4 db 0B2h,0B2h,0B2h,0B2h,'      $'

barra_3 db 0B2h,0B2h,0B2h,'       $'

barra_2 db 0B2h,0B2h,'        $'

barra_1 db 0B2h,'         $'

barra_0 db '          $'

ataque db 'ATAQUE','$'

vida db 'VIDA','$'

velocidade db 'VELOCIDADE','$' 

defesa db 'DEFESA','$'

quick db 'REGENERAR HP','$'

risestats db 'AUMENTAR ATAQUE','$'

class_ninja db 'Ninja','$'

class_tank db 'Tanque','$'

class_warrior db 'Guerreiro','$'

linha_meio_grande db 0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,'$' 
 

END