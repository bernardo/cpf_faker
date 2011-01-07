require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'br/cnpj'

describe Faker::CNPJ do
  
  it "generates valid number only cnpjs" do
    generated = Faker::CNPJ.numeric
    generated.should =~ (/^\d{14}$/)
    BR::CNPJ.valid?(generated).should == true
  end
  
  it "generates valid pretty printed cpfs" do
    generated = Faker::CNPJ.pretty
    generated.should =~ (/^\d{2}\.\d{3}\.\d{3}\/\d{4}\-\d{2}$/)
    clean = generated.gsub(/\.|\-|\//, '')
    BR::CNPJ.valid?(clean).should == true
  end
  
  it "has a bunch of aliases in case you forget the method names" do
    lambda{Faker::CNPJ.number}.should_not raise_error
    lambda{Faker::CNPJ.numbers}.should_not raise_error
    lambda{Faker::CNPJ.cnpj}.should_not raise_error   
    lambda{Faker::CNPJ.formatted}.should_not raise_error   
  end
  
end
