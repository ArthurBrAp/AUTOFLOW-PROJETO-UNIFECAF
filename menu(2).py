import mysql.connector
from datetime import date

db = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="root",
    database="concessionaria"
)

cursor = db.cursor()

while True:

    print('\n===== CONCESSIONÁRIA =====')
    print('1 - Comprar veículo')
    print('2 - Cadastrar cliente')
    print('3 - Cadastrar veículo')
    print('4 - Sair')

    opcao = input('Escolha uma opção: ')

    # COMPRAR VEÍCULO
    if opcao == '1':

        print('\n=== VEÍCULOS DISPONÍVEIS ===')

        comando = '''
        SELECT id_veiculo, marca, modelo, valor, numero_portas,
        cambio, motor, ano, cor, status, condicao
        FROM tb_veiculo
        WHERE status = 'disponivel'
        '''

        cursor.execute(comando)
        veiculos = cursor.fetchall()

        for v in veiculos:
            print('-' * 50)
            print(f"ID: {v[0]}")
            print(f"Marca: {v[1]}")
            print(f"Modelo: {v[2]}")
            print(f"Valor: R$ {float(v[3]):.2f}")
            print(f"Portas: {v[4]}")
            print(f"Câmbio: {v[5]}")
            print(f"Motor: {v[6]}")
            print(f"Ano: {v[7]}")
            print(f"Cor: {v[8]}")
            print(f"Status: {v[9]}")
            print(f"Condição: {v[10]}")

        id_cliente = int(input('\nDigite o ID do cliente: '))
        id_veiculo = int(input('Digite o ID do veículo: '))

        # buscar valor do veículo
        comando_valor = '''
        SELECT valor FROM tb_veiculo
        WHERE id_veiculo = %s
        '''

        cursor.execute(comando_valor, (id_veiculo,))
        resultado = cursor.fetchone()

        if resultado is None:
            print('Veículo não encontrado.')
            continue

        valor_final = float(resultado[0])

        # PAGAMENTO
        valor_pago = float(input('Digite o valor pago pelo cliente: R$ '))

        if valor_pago >= valor_final:

            # inserir venda
            comando_venda = '''
            INSERT INTO tb_venda
            (data_venda, valor_final, id_cliente, id_veiculo)
            VALUES (%s, %s, %s, %s)
            '''

            valores = (
                date.today(),
                valor_final,
                id_cliente,
                id_veiculo
            )

            cursor.execute(comando_venda, valores)

            # atualizar status do veículo
            comando_update = '''
            UPDATE tb_veiculo
            SET status = 'indisponivel'
            WHERE id_veiculo = %s
            '''

            cursor.execute(comando_update, (id_veiculo,))
            db.commit()

            # buscar nome do cliente
            comando_cliente = '''
            SELECT nome FROM tb_cliente
            WHERE id_cliente = %s
            '''
            cursor.execute(comando_cliente, (id_cliente,))
            cliente = cursor.fetchone()

            nome_cliente = cliente[0] if cliente else 'Cliente'

            print('\n' + '=' * 50)
            print('            FICHA DE COMPRA - AUTOFLOW')
            print('=' * 50)
            print(f'Cliente: {nome_cliente}')
            print(f'Veículo ID: {id_veiculo}')
            print(f'Valor pago: R$ {valor_pago:.2f}')
            print('\nParabéns pela sua compra!')
            print('Agradecemos por escolher nossa concessionária AutoFlow!')
            print('=' * 50 + '\n')

        else:
            print('\nNÃO FOI POSSÍVEL REALIZAR A COMPRA.')
            print('Valor insuficiente.')

            

    # CADASTRAR VEÍCULO E CLIENTE
    elif opcao == '3':

        marca = input('Marca: ')
        modelo = input('Modelo: ')
        ano = int(input('Ano: '))
        cor = input('Cor: ')
        status = input('Status: ')
        condicao = input('Condição: ')
        valor = float(input('Valor: '))
        numero_portas = int(input('Número de portas: '))
        cambio = input('Câmbio: ')
        motor = input('Motor: ')

        comando = '''
        INSERT INTO tb_veiculo
        (marca, modelo, ano, cor, status, condicao, valor,
        numero_portas, cambio, motor)
        VALUES (%s, %s, %s, %s, %s, %s, %s,
        %s, %s, %s)
        '''

        valores = (
            marca, modelo, ano, cor, status,
            condicao, valor, numero_portas,
            cambio, motor
        )

        cursor.execute(comando, valores)
        db.commit()

        print('Veículo cadastrado com sucesso!')

    elif opcao == '2':

        nome = input('Nome do cliente: ')                     
        cpf = input('CPF: ')
        telefone = input('Telefone:')
        email = input('Email: ')

        comando ='''
        INSERT INTO tb_cliente
        (nome, CPF, telefone, email)    
        VALUES (%s, %s, %s, %s)
    '''
        valores = (nome, cpf, telefone, email)


        cursor.execute(comando, valores)
        db.commit()

        print('Cliente cadastrado com sucesso!')

    # SAIR
    elif opcao == '4':
        print('Sistema encerrado.')
        break

    else:
        print('Opção inválida.')

cursor.close()
db.close()