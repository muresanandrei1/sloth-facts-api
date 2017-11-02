module Response
  def json_resposne(object, stauts = :ok)
    render json: object, status: status
  end
end