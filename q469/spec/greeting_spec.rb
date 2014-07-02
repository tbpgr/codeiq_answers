# encoding: utf-8
require "spec_helper"
require "timecop"
require_relative "../lib/greeting"

module Greeting
  describe Greeting do
    cases = [
      {
        case_no: 1,
        locale: :ja,
        time: Time.local(2013, 1, 1, 5, 0 ,0),
        expected: "おはようございます",
      },
      {
        case_no: 2,
        locale: :ja,
        time: Time.local(2013, 1, 1, 11, 59 ,0),
        expected: "おはようございます",
      },
      {
        case_no: 3,
        locale: :ja,
        time: Time.local(2013, 1, 1, 12, 50 ,0),
        expected: "こんにちは",
      },
      {
        case_no: 4,
        locale: :ja,
        time: Time.local(2013, 1, 1, 17, 59 ,0),
        expected: "こんにちは",
      },
      {
        case_no: 5,
        locale: :ja,
        time: Time.local(2013, 1, 1, 18, 00 ,0),
        expected: "こんばんは",
      },
      {
        case_no: 6,
        locale: :ja,
        time: Time.local(2013, 1, 1, 23, 59 ,0),
        expected: "こんばんは",
      },
      {
        case_no: 7,
        locale: :ja,
        time: Time.local(2013, 1, 2, 0, 0 ,0),
        expected: "こんばんは",
      },
      {
        case_no: 8,
        locale: :ja,
        time: Time.local(2013, 1, 2, 4, 59 ,0),
        expected: "こんばんは",
      },
      {
        case_no: 9,
        locale: :en,
        time: Time.local(2013, 1, 1, 5, 0 ,0),
        expected: "Good Morning",
      },
      {
        case_no: 10,
        locale: :en,
        time: Time.local(2013, 1, 1, 11, 59 ,0),
        expected: "Good Morning",
      },
      {
        case_no: 11,
        locale: :en,
        time: Time.local(2013, 1, 1, 12, 50 ,0),
        expected: "Good Afternoon",
      },
      {
        case_no: 12,
        locale: :en,
        time: Time.local(2013, 1, 1, 17, 59 ,0),
        expected: "Good Afternoon",
      },
      {
        case_no: 13,
        locale: :en,
        time: Time.local(2013, 1, 1, 18, 00 ,0),
        expected: "Good Evening",
      },
      {
        case_no: 14,
        locale: :en,
        time: Time.local(2013, 1, 1, 24, 00 ,0),
        expected: "Good Evening",
      },
      {
        case_no: 15,
        locale: :en,
        time: Time.local(2013, 1, 1, 0, 00 ,0),
        expected: "Good Evening",
      },
      {
        case_no: 16,
        locale: :en,
        time: Time.local(2013, 1, 2, 4, 59 ,0),
        expected: "Good Evening",
      },
      {
        case_no: 17,
        locale: :invalid,
        error: RuntimeError
      },
    ]

    cases.each do |c|
      it "#greet case_no=#{c[:case_no]}" do
        if c[:error]
          # given & when & then
          expect{Greeting.new(c[:locale])}.to raise_error(c[:error])
        else
          # given
          greeter = Greeting.new(c[:locale])
          Timecop.freeze(c[:time])
          # when
          actual = greeter.greet
          # then
          expect(actual).to eq(c[:expected])
        end
      end
    end
  end
end
