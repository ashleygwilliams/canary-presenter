class NZip

  def initialize(data)
    @nzips = data
  end

  def zipToHood(zip)
    hood = @nzips.select{|k,v| v.include?(zip) }
    hood.keys[0]
  end

  def hoodToZip(hood)
    @nzips[hood]
  end

end