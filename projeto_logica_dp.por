programa
{
// Serratec 2024.2 - Turma 022 Nova Friburgo/Teresópolis - Lógica de Programação: Grupo 6  - Prof. Nicolas Theodoro
// Eric Duarte 
// Isabella Pinheiro
// Renata Rodrigues 
// Romulo Lourenço
// Thiago Branco
// Vinícius Ramos 

    inclua biblioteca Util --> u
    const inteiro LIMITECOLABORADORES = 100
    // Definição dos vetores para armazenar os dados dos colaboradores
    cadeia nomes[LIMITECOLABORADORES]
    cadeia cpfs[LIMITECOLABORADORES]
    real salarios[LIMITECOLABORADORES]
    inteiro entradas[LIMITECOLABORADORES]
    inteiro saidas[LIMITECOLABORADORES]
    inteiro totalColaboradores = 0

    funcao inicio()
    {
       inteiro respostaOpcao
	  logico menu = verdadeiro
	
		enquanto (menu)
        {
            menuDeOpcoes()
            leia(respostaOpcao)
            // Escolha da opção do menu
            escolha (respostaOpcao)
            {
                caso 1:
                    // Chama a função para cadastrar um novo colaborador
                    cadastrarColaborador()
                    pare
                caso 2:
                    // Chama a função para editar um colaborador existente
                    editarColaborador()
                    pare
                caso 3:
                    // Chama a função para calcular a folha de pagamento
                    calcularFolhaPagamento()
                    pare
                caso 4:
                    // Chama a função para registrar o ponto de um colaborador
                    controleDePonto()
                    pare
                caso 5:
                    // Chama a função para exibir o relatório completo dos colaboradores
                    exibirRelatorioCompleto()
                    pare
                caso 6:
                	// Chama a função surpresa
                	surpresa()
                	pare
                caso 7:
                    // Sai do programa
                    sair()
                    menu = falso
                    pare
                caso contrario:
                    // Mensagem de opção inválida
                    escreva("\nOpção inválida!\n")
            }
          }
     }

    funcao menuDeOpcoes()
    {   
    	   // Menu principal
        escreva("\n\t\t\tMenu de Opções")
        escreva("\n---------------------------------------------------------------\n")
        escreva("(1) Cadastrar Colaborador\t\t(2) Editar Colaborador\n")
        escreva("(3) Calcular Folha de Pagamento\t\t(4) Registrar Ponto\n")
        escreva("(5) Exibir Relatório Completo\t\t(6) Surpresa\n")
        escreva("(7) Sair")
    	   escreva("\n---------------------------------------------------------------\n")
        escreva("Escolha uma opção: ")
	}	

    funcao cadastrarColaborador()
	    {
	        // Verifica se o limite de colaboradores foi atingido
	        se (totalColaboradores >= LIMITECOLABORADORES)
	        {
	            escreva("\n[Limite de colaboradores atingido!]\n")
	            retorne
	        }
	
	        // Solicita os dados do novo colaborador
	       escreva("Digite o nome do colaborador: ")
	       leia(nomes[totalColaboradores])
	       escreva("Digite o CPF do colaborador: ")
	       leia(cpfs[totalColaboradores])
	       escreva("Digite o salário do colaborador: ")
	       leia(salarios[totalColaboradores])
	
	        // Incrementa o total de colaboradores
	       totalColaboradores++
	       escreva("\nCadastrando colaborador...\n")
	       u.aguarde(600)
	       escreva("\n[Colaborador cadastrado com sucesso!]\n")
	       u.aguarde(1500)
	       limpa()
	       
		  //Apresenta mini menu de opções 	
	       inteiro var_temp_opcao
	       escreva("\nSelecione uma opção: ")
	       escreva("\n(1). Cadastrar novo Colaborador\t(2). Editar Colaborador\t(3). Voltar ao menu principal\n")
	       leia(var_temp_opcao)
	       miniMenu(var_temp_opcao)         
	    }
    
    funcao editarColaborador()
    {
    cadeia cpf
    inteiro indice = -1

    // Solicita o CPF do colaborador a ser editado
    escreva("Digite o CPF do colaborador a ser editado: ")
    leia(cpf)

    escreva("\nBuscando colaborador...\n")
    u.aguarde(600)

    // Procura o colaborador pelo CPF
    para (inteiro i = 0; i < totalColaboradores; i++)
    {
        se (cpfs[i] == cpf)
        {
            indice = i
            pare
        }
    }

    // Verifica se o colaborador foi encontrado
    se (indice == -1)
    {
        escreva("\n[CPF não encontrado!]\n")
        retorne
    }

    // Solicita os novos dados do colaborador
    escreva("\nDigite o novo nome do colaborador (atual: ", nomes[indice], "): ")
    leia(nomes[indice])
    escreva("Digite o novo CPF do colaborador (atual: ", cpfs[indice], "): ")
    leia(cpfs[indice])
    escreva("Digite o novo salário do colaborador (atual: ", salarios[indice], "): ")
    leia(salarios[indice])

    escreva("\n[Dados do colaborador atualizados com sucesso!]\n")
    u.aguarde(1500)
    limpa()
    
    //Apresenta mini menu de opções 		     
    inteiro var_temp_opcao
    escreva("\nSelecione uma opção: ")
    escreva("\n(1). Cadastrar Colaborador\t(2). Editar outro Colaborador\t(3). Voltar ao menu principal\n")
    leia(var_temp_opcao)
    miniMenu(var_temp_opcao)
}

    funcao calcularFolhaPagamento()
    {
        real salarioBruto, descontoINSS, descontoIRRF, salarioLiquido

        // Calcula a folha de pagamento para cada colaborador
        para (inteiro i = 0; i < totalColaboradores; i++)
        {
            salarioBruto = salarios[i]
            descontoINSS = calcularDescontoINSS(salarioBruto)
            descontoIRRF = calcularDescontoIRRF(salarioBruto)
            salarioLiquido = salarioBruto - descontoINSS - descontoIRRF

            // Exibe os dados da folha de pagamento do colaborador
            escreva("\n**************************")
            escreva("\nColaborador: ", nomes[i], "\n")
            escreva("Salário Bruto: ", salarioBruto, "\n")
            escreva("Desconto INSS: ", descontoINSS, "\n")
            escreva("Desconto IRRF: ", descontoIRRF, "\n")
            escreva("Salário Líquido: ", salarioLiquido, "\n")
            u.aguarde(8000)
            limpa()
        }
    }

    funcao real calcularDescontoINSS(real salario)
    {
        // Calcula o desconto do INSS com base no salário
        se (salario <= 1412.00)
        {
            retorne salario * 0.075
        }
        senao se (salario <= 2666.68)
        {
            retorne salario * 0.09
        }
        senao se (salario <= 4000.03)
        {
            retorne salario * 0.12
        }
        senao
        {
            retorne salario * 0.14
        }
    }

    funcao real calcularDescontoIRRF(real salario)
    {
        // Calcula o desconto do IRRF com base no salário
        se (salario <= 2112.00)
        {
            retorne 0.0
        }
        senao se (salario <= 2826.65)
        {
            retorne salario * 0.075
        }
        senao se (salario <= 3751.05)
        {
            retorne salario * 0.15
        }
        senao se (salario <= 4664.68)
        {
            retorne salario * 0.225
        }
        senao
        {
            retorne salario * 0.275
        }
    }

    funcao controleDePonto()
	{
	   cadeia cpfDoColaborador 
        // Busque o colaborador pelo CPF 
	   escreva("Informe o CPF do colaborador: \n")		
	   leia(cpfDoColaborador)

	   escreva("\nBuscando colaborador...\n")
        u.aguarde(600)
        
	   //Condição para tratamento de erro por CPF não encontrado		
	   para(inteiro i=0; i<LIMITECOLABORADORES; i++)
	   {
		  se(cpfs[i] == cpfDoColaborador)
		  {
			escreva("\nO colaborador(a), ", nomes[i],", de CPF ",cpfs[i] , ", foi identificado! \n")
			registroDoPonto(i)
			pare 
		  }
		  se(cpfs[i] != cpfDoColaborador)
		  {
			inteiro var_temp_opcao
			escreva("CPF não identificado!")
			escreva("\n-------------------------------\n")
			escreva("\nSelecione uma opção: ")
			escreva("\n(1). Tentar novamente\t(2). Cadastrar Colaborador\t(3). Voltar ao menu principal\n")
			leia(var_temp_opcao)

				se(var_temp_opcao == 1)
				{
					controleDePonto()
				}
				senao se(var_temp_opcao == 2)
				{
					cadastrarColaborador()					
				}
				senao se(var_temp_opcao == 3)
				{
					inicio()					
				}senao
				{
					escreva("Opção inválida, você está saindo do programa!")
					escreva("\n-----------------------------------------\n")
					
					sair()
				}			
				pare
		}
	   }
	}

    funcao registroDoPonto(inteiro i)
	{
		inteiro horaEntrada, horaSaida, diferencaHoras, submenu
		// Função para registro de ponto
		escreva("---------------\n")
		escreva("HORA DE ENTRADA\n")		
		escreva("---------------\n")		
					
		escreva("Informe a hora e os minutos (formato HHMM): \n")
		leia(entradas[i])
					
		horaEntrada = entradas[i]/100
								
		escreva("---------------\n")
		escreva("HORA DE SAÍDA\n")		
		escreva("---------------\n")	
		escreva("Informe a hora e os minutos (formato HHMM): \n")
		leia(saidas[i])	
				
		horaSaida= saidas[i]/100 
		
		diferencaHoras = horaSaida - horaEntrada

		u.aguarde(1500)
		escreva("Ponto registrado com sucesso!\n")
		escreva("-------------------------------")
		
		escreva("\nSelecione uma opção: ")		
		escreva("\n(1). Cadastrar ponto\t(2). Exibir Relatório de Ponto\t(3). Voltar ao menu principal\n")	
		leia(submenu)
		
			se(submenu == 1)
			{
				controleDePonto()
			}				
			
			senao se(submenu == 2) 
			{
				escreva("\n----------------\n")
				escreva("Relatório do Ponto\n\n")						
				escreva("Nome: ", nomes[i], ".\n")	
				escreva("CPF: ", cpfs[i], ".\n")	
				escreva("Horário de Entrada: ", entradas[i], ".\n")	
				escreva("Horário de Saída: ", saidas[i], ".\n")	
				escreva("Quantidade de Horas Trabalhadas: ", diferencaHoras, "horas.\n")					
					se(diferencaHoras >= 8) // condição para avaliar se colaborador cumpriu as 8 horas de trabalho
					{
						escreva("O funcionário completou a carga horária de 8h diárias. \n")
					}
					senao
					{
						escreva("O funcionário não completou a carga horária de 8h diárias. \n")		
					}				
						escreva("\n-------------------------------\n")
						u.aguarde(3000)
						inicio()					
			}senao se(submenu == 3)
			{
				inicio()							
			}
			senao
			{
				escreva("Opção inválida. Você está saindo do programa!")
				escreva("\n-----------------------------------------\n")
				retorne
			}		
	}

    funcao exibirRelatorioCompleto()
    {
        // Exibe o relatório completo dos colaboradores
        para (inteiro i = 0; i < totalColaboradores; i++)
        {
        	  escreva("\n**************************")
            escreva("\nColaborador: ", nomes[i], "\n")
            escreva("CPF: ", cpfs[i], "\n")
            escreva("Salário: ", salarios[i], "\n")
            escreva("Entrada: ", entradas[i], "\n")
            escreva("Saída: ", saidas[i], "\n")
            u.aguarde(3000)
            
        }
    }
	  
    funcao sair()
	{
	     // Exibe a mensagem de saída do programa
		escreva("\nSaindo")
          u.aguarde(500)
          escreva(".")
          u.aguarde(500)
          escreva(".")
          u.aguarde(500)
          escreva(".\n")
          u.aguarde(500)
	}

    funcao surpresa()
	{
	   // Exibe a mensagem surpresa
	   escreva(" _   _ ___ ____ ___  _        _    ____    ____    _      _  ___   \n")
        escreva("| \\ | |_ _/ ___/ _ \\| |      / \\  / ___|  |  _ \\  / \\    / |/ _ \\  \n")
        escreva("|  \\| || | |  | | | | |     / _ \\ \\___ \\  | | | |/ _ \\   | | | | | \n")
        escreva("| |\\  || | |__| |_| | |___ / ___ \\ ___) | | |_| / ___ \\  | | |_| | \n")
        escreva("|_| \\_|___\\____\\___/|_____/_/   \\_\\____/  |____/_/   \\_\\ |_|\\___/  \n")
        escreva("|  _ \\|  _ \\    / \\    | \\ | |/ _ \\_ _/ ___|                       \n")
        escreva("| |_) | |_) |  / _ \\   |  \\| | | | | |\\___ \\                       \n")
        escreva("|  __/|  _ <  / ___ \\  | |\\  | |_| | | ___) |                      \n")
        escreva("|_|   |_| \\_\\/_/   \\_\\ |_| \\_|\\___/___|____/                      \n")
	}

    funcao miniMenu(inteiro var_temp_opcao){
    		// Mini menu de opções
		se(var_temp_opcao == 1) 
	       {
	       limpa()
	       cadastrarColaborador()
	       }
	       senao se(var_temp_opcao == 2)
	       {
	       limpa()
	       editarColaborador()                    
	       }
	       senao se(var_temp_opcao == 3)
	       {
	       limpa()
	 
	       inicio()                    
	       }senao
	       {
	       limpa()
	       escreva("Opção inválida, você está saindo do programa!")
	       escreva("\n-----------------------------------------\n")	                    
	       sair()
		}	
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 11197; 
 * @DOBRAMENTO-CODIGO = [20, 68, 81, 114, 163, 187, 208, 233, 284, 352, 368, 381, 395];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */