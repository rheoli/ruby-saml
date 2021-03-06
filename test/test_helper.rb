require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'mocha'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'ruby-saml'

class Test::Unit::TestCase
  def response_document
    @response_document ||= File.read(File.join(File.dirname(__FILE__), 'responses', 'response1.xml.base64'))
  end

  def response_document_2
    @response_document2 ||= File.read(File.join(File.dirname(__FILE__), 'responses', 'response2.xml.base64'))
  end

  def response_document_3
    @response_document3 ||= File.read(File.join(File.dirname(__FILE__), 'responses', 'response3.xml.base64'))
  end

  def response_document_4
    @response_document4 ||= File.read(File.join(File.dirname(__FILE__), 'responses', 'response4.xml.base64'))
  end
  
  def response_document_5
    doc = Base64.decode64(response_document)
    doc.gsub!(/NotBefore=\"(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):(\d{2})Z\"/, "NotBefore=\"#{(Time.now-300).getutc.strftime("%Y-%m-%dT%XZ")}\"")
    doc.gsub!(/NotOnOrAfter=\"(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):(\d{2})Z\"/, "NotOnOrAfter=\"#{(Time.now+300).getutc.strftime("%Y-%m-%dT%XZ")}\"")
    Base64.encode64(doc)
  end
  
  def signature_fingerprint_1
    @signature_fingerprint1 ||= "C5:19:85:D9:47:F1:BE:57:08:20:25:05:08:46:EB:27:F6:CA:B7:83"
  end

end
