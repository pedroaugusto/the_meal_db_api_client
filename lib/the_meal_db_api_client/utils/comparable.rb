module TheMealDbApiClient::Utils::Comparable
  def ==(o)
    self.state == o.state
  end
end