Dado('que o usuario consulte informacoes de Funcionario') do
    @getlist = Employee_Requests.new
  end
  
  Quando('ele realizaar a pesquisa') do
    @list_employee = @getlist.find_employee
  end
  
  Entao('uma lista de funcionarios deve retornar') do
    expect(@list_employee.code).to eql 200
    expect(@list_employee.message).to eql "OK"
  end

Dado('que o usuario cadastre um novo funcionario') do
  @create = Employee_Requests.new
end
  
  Quando('ele enviar as informacoes do funcionario') do
    @create_employee = @create.create_employee("Sandro", 39000, 36)
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


Dado('que o usuario atualize informacoes de um funcionario') do
  @request = Employee_Requests.new
end
    
  Quando('ele enviar as novas informacoes') do
    @update_employee = @request.update_employee(@request.find_employee['data'][0]['id'], "Sandro", 40000, 38)
    puts (@update_employee)
  end
    
  Entao('essas informacoes serao atualizadas') do
    expect(@update_employee.code).to eql (200)
    expect(@update_employee.msg).to eql "OK"
    expect(@update_employee["status"]).to eql "success"
    expect(@update_employee["message"]).to eql 'Successfully! Record has been updated.'
    expect(@update_employee["data"]["employee_name"]).to eql "Sandro"
    expect(@update_employee["data"]["employee_salary"]).to eql 40000
    expect(@update_employee["data"]["employee_age"]).to eql 38
  end


Dado('que o usuario delete um funcionario') do
  @request = Employee_Requests.new
end
      
  Quando('ele enviar a identificacao unica') do
    @delete_employee = @request.delete_employee(@request.find_employee['data'][0]['id'])
  end
      
  Entao('esse funcionario sera deletado do sistema') do
    expect(@delete_employee.code).to eql 200
    expect(@delete_employee["status"]).to eql "success"
    expect(@delete_employee["message"]).to eql "Successfully! Record has been deleted"
    expect(@delete_employee["data"]).to eql "2"
  end