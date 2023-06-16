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
    @text_format = []
    call!
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
    query['format'].split(',')
  end

  def call!
    @time_formats.map do |format|
      @errors << format unless TIME_METHODS.keys.include?(format)
      @text_format << TIME_METHODS[format]
    end
  end

  def falure
    "Unknown time format [#{@errors.join(', ')}]"
  end

  def success
    Time.now.strftime(@text_format.join('-'))
  end
end
