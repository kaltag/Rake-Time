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

  def call!
    @time_formats.map do |format|
      if TIME_METHODS[format]
        @text_format << TIME_METHODS[format]
      else
        @errors << format
      end
    end
  end

  private

  def parse(query)
    query['format'].split(',')
  end

  def falure
    "Unknown time format [#{@errors.join(', ')}]"
  end

  def success
    Time.now.strftime(@text_format.join('-'))
  end
end
