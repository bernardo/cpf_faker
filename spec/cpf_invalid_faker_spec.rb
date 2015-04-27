require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'br/cpf'

describe Faker::CPFInvalid do
  
  it "generates invalid number only cpfs" do
    generated = Faker::CPFInvalid.numeric
    generated.should =~ /^\d{11}$/
    BR::CPF.valid?(generated).should == false
  end
  
  it "generates invalid pretty printed cpfs" do
    generated = Faker::CPFInvalid.pretty
    generated.should =~ (/^\d{3}\.\d{3}\.\d{3}\-\d{2}$/)
    clean = generated.gsub(/\.|\-/, '')
    BR::CPF.valid?(clean).should == false
  end
  
  it "has a bunch of aliases in case you forget the method names" do
    lambda{Faker::CPFInvalid.number}.should_not raise_error
    lambda{Faker::CPFInvalid.numbers}.should_not raise_error
    lambda{Faker::CPFInvalid.cpf}.should_not raise_error
    lambda{Faker::CPFInvalid.formatted}.should_not raise_error      
  end
  
end
