import psycopg2

def execute_q(query):

    conn = psycopg2.connect(
        host="zepalheta-postgres",
        database="zepalheta",
        user="postgres",
        password="qaninja"
    )

    cur = conn.cursor()

    cur.execute(query)

    conn.commit()
    cur.close()
    conn.close()

def format_cpf(cpf):
    return cpf[:3] + "." + cpf[3:6] + "." + cpf[6:9] + "-" + cpf[9:]  

def insert_cliente(name, cpf, address, phone):

    cpf_formatado = format_cpf(cpf)

    query = "insert into public.customers (name, cpf, address , phone_number) "\
        "values ('{}', '{}', '{}', '{}');".format(name, cpf_formatado, address, phone)
    print(query)
    
    execute_q(query)

def remove_cliente_por_cpf(cpf):

    cpf_formatado = format_cpf(cpf) 

    query = "delete from public.customers where cpf = '{}';".format(cpf_formatado)
    print(query)

    execute_q(query)

def remove_equipo_por_nome(nome):

    query = "delete from public.equipos where name = '{}';".format(nome)    
    print(query)

    execute_q(query)

def inserir_equipo(nome, diaria):

    query = "insert into public.equipos (name, daily_price) values ('{}', '{}');".format(nome, diaria)
    print(query)

    execute_q(query)