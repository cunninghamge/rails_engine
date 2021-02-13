class ErrorSerializer
  def self.invalid_parameters
    { 'message': 'your request could not be completed',
      'errors': [
        'invalid request parameters'
      ] }
  end

  def self.record_not_found(error)
    { 'message': 'your request could not be completed',
      'errors': [
        error
      ] }
  end

  def self.record_invalid(error)
    { 'message': 'your request could not be completed',
      'errors': [
        error
      ] }
  end
end
