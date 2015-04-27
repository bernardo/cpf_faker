require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'br/cnpj'

describe Faker::CNPJInvalid do
  
  it "generates invalid number only cnpjs" do
    generated = Faker::CNPJInvalid.numeric
    generated.should =~ (/^\d{14}$/)
    BR::CNPJ.valid?(generated).should == false
  end
  
  it "generates invalid pretty printed cpfs" do
    generated = Faker::CNPJInvalid.pretty
    generated.should =~ (/^\d{2}\.\d{3}\.\d{3}\/\d{4}\-\d{2}$/)
    clean = generated.gsub(/\.|\-|\//, '')
    BR::CNPJ.valid?(clean).should == false
  end
  
  it "has a bunch of aliases in case you forget the method names" do
    lambda{Faker::CNPJInvalid.number}.should_not raise_error
    lambda{Faker::CNPJInvalid.numbers}.should_not raise_error
    lambda{Faker::CNPJInvalid.cnpj}.should_not raise_error   
    lambda{Faker::CNPJInvalid.formatted}.should_not raise_error   
  end
  
end
