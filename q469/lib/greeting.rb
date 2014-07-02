# encoding: utf-8

module Greeting
  class Greeting
    def initialize(locale)
      @greet = GreetFactory.get_greet locale
    end

    def greet
      @greet.local_greet Time.now.hour
    end
  end

  class Greet
    MIDNIGHT= (0..4)
    MORNING = (5..11)
    AFTERNOON = (12..17)
    NIGHT = (18..23)

    def local_greet(hour)
      case hour
      when MORNING
        morning_greet
      when AFTERNOON
        afternoon_greet
      when NIGHT,MIDNIGHT
        night_greet
      end
    end

    private
    def morning_greet
      raise "not implement"
    end

    def afternoon_greet
      raise "not implement"
    end

    def night_greet
      raise "not implement"
    end
  end

  GREETS = [
    {
      class_name: "Japanese",
      morning: "おはようございます",
      afternoon: "こんにちは",
      night: "こんばんは",
    },
    {
      class_name: "English",
      morning: "Good Morning",
      afternoon: "Good Afternoon",
      night: "Good Evening",
    },
  ]
  classes = []

  GREETS.each do |greet|
    classes << Class.new(Greet) do |klass|
      define_method(:morning_greet) {greet[:morning]}
      define_method(:afternoon_greet) {greet[:afternoon]}
      define_method(:night_greet) {greet[:night]}
    end
  end

  GREETS.each_with_index {|klass, i|eval "#{klass[:class_name]}Greeting = classes[#{i}]"}

  class GreetFactory
    class << self
      def get_greet(locale)
        return JapaneseGreeting.new if locale == :ja
        return EnglishGreeting.new if locale == :en
        raise "invalid locale"
      end
    end
  end
end
