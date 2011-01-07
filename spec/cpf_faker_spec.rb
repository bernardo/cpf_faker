require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'br/cpf'

describe Faker::CPF do
  
  it "generates valid number only cpfs" do
    generated = Faker::CPF.numeric
    generated.should =~ /^\d{11}$/
    BR::CPF.valid?(generated).should == true
  end
  
  it "generates valid pretty printed cpfs" do
    generated = Faker::CPF.pretty
    generated.should =~ (/^\d{3}\.\d{3}\.\d{3}\-\d{2}$/)
    clean = generated.gsub(/\.|\-/, '')
    BR::CPF.valid?(clean).should == true
  end
  
  it "has a bunch of aliases in case you forget the method names" do
    lambda{Faker::CPF.number}.should_not raise_error
    lambda{Faker::CPF.numbers}.should_not raise_error
    lambda{Faker::CPF.cpf}.should_not raise_error
    lambda{Faker::CPF.formatted}.should_not raise_error      
  end
  
end
