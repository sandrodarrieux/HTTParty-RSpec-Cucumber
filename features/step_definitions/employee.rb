Dado('que o usuario consulte informacoes de Funcionario') do
    @get_url = 'http://dummy.restapiexample.com/api/v1/employees'
  end
  
  Quando('ele realizaar a pesquisa') do
    @list_employee = HTTParty.get(@get_url)
  end
  
  Entao('uma lista de funcionarios deve retornar') do
    expect(@list_employee.code).to eql 200
    expect(@list_employee.message).to eql "OK"
  end

  Dado('que o usuario cadastre um novo funcionario') do
    @post_url = 'http://dummy.restapiexample.com/api/v1/create'
  end
  
    Quando('ele enviar as informacoes do funcionario') do
      @create_employee = HTTParty.post(@post_url, :headers => {'Content-Type': 'application/json'}, body: {
        "id": 27,
        "employee_name": "Sandro",
        "employee_salary": 39000,
        "employee_age": 36,
        "profile_image": ""
      }.to_json)
      
      puts @create_employee
    end
  
    Entao('esse funcionario sera cadastrado') do
      expect(@create_employee.code).to eql 200
      expect(@create_employee.msg).to eql "OK"
      expect(@create_employee["status"]).to eql "success"
      expect(@create_employee["message"]).to eql "Successfully! Record has been added."
      expect(@create_employee["data"]["employee_name"]).to eql "Sandro"
      expect(@create_employee["data"]["employee_salary"]).to eql 39000
      expect(@create_employee["data"]["employee_age"]).to eql 36
    end