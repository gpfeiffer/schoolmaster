module PathwaysHelper
  def status_to_text(status)
    {
      'C' => 'Core',
      'R' => 'Highly Recommended',
      'O' => 'Option'
    }[status]
  end
end
