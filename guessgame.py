import random

# funcao construtora de titulos

def title(text):
    print('#####################################################################################################')
    print('#                                                                                                   #')
    print('# {:^97} #'.format(text)) # texto centrado
    print('#                                                                                                   #')
    print('#####################################################################################################')

# funcao que trata das tentativas

def guess(solution):
    for i in range(10): # 10 tentativas
        guess = int(input('Tentativa nº {}: '.format(i+1)))
        if guess == solution: # se acertar
            winner(i+1)
            break
        elif guess > solution: # se o numero for muito alto
            print('\nThe number you typed is too high\n')
        elif guess < solution: # se o numero for muito baixo
            print('\nThe number you typed is too low\n')
    if guess != solution:
        looser()

# funcao que trata da vitoria

def winner(tries):
    title('Congratulations!! You have won and it only took you {} tries'.format(tries))

# funcao que trata da derrota

def looser():
    title('Aww man, you almost had it!! Better luck next time')

# funcao que trata do reinicio do jogo

def restart():
    control = False
    while not control:
        choice = input ('Would you like to play again? (S/n)\n')
        if choice == 'n' or choice == 'N': # se a resposta for n ou N
            control = True
            return False
        elif choice == 'y' or choice == 'Y': # se a resposta for y ou Y
            control = True
            return True
        elif choice != "": # se a resposta for outra letra ou numero qualquer
            print('Invalid choice. Please try again.')
        else: # se apenas carregar no enter sem introduzir nada
            control = True
            return True

# estrutura principal

choice = True

while choice:
    solution = random.randint(1,100)
    
    title('Guess Game')
    title('You have 10 tries to guess a random number between 1 and 100. You\'ll get hints as you guess')

    guess(solution)

    choice = restart()
