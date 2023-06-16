class Format

  TIME_METHODS = {
    'year' => '%Y',
    'month' => '%m',
    'day' => '%d',
    'hour' => '%H',
    'minute' => '%M',
    'second' => '%S'
  }.freeze

  def initialize(query)
    @time_formats = parse(query)
    @errors = []
    validate_format!
  end

  def body
    if success?
      success
    else
      falure
    end
  end

  def success?
    @errors.empty?
  end

  private

  def parse(query)
    query.split('=')[-1].split('%2C')
  end

  def validate_format!
    @time_formats.map { |format| @errors << format unless TIME_METHODS.keys.include?(format) }
  end

  def falure
    ["Unknown time format [#{@errors.join(', ')}]"]
  end

  def success
    [Time.now.strftime(split_format)]
  end

  def split_format
    @time_formats.map { |format| TIME_METHODS[format] }.join('-')
  end
end
