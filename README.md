# Aliyun

[![Fury](https://badge.fury.io/rb/aliyun.png)](http://badge.fury.io/rb/aliyun)
[![Code Climate](https://codeclimate.com/github/Lax/aliyun/badges/gpa.svg)](https://codeclimate.com/github/Lax/aliyun)
[![Test Coverage](https://codeclimate.com/github/Lax/aliyun/badges/coverage.svg)](https://codeclimate.com/github/Lax/aliyun/coverage)
[![Travis](https://travis-ci.org/Lax/aliyun.svg?branch=master)](https://travis-ci.org/Lax/aliyun)
[![CircleCI](https://circleci.com/gh/Lax/aliyun/tree/master.png?style=shield)](https://circleci.com/gh/Lax/aliyun)
[![security](https://hakiri.io/github/Lax/aliyun/master.svg)](https://hakiri.io/github/Lax/aliyun/master)
[![Dependency Status](https://gemnasium.com/Lax/aliyun.svg)](https://gemnasium.com/Lax/aliyun)

Ruby wrapper of Aliyun API for system adminstrator.

## Installation

Add `gem 'aliyun'` to your application's Gemfile:

    gem 'aliyun'

And then run:

    $ bundle install

Or install it with gem command:

    $ gem install aliyun

## Usage

Example:

    require 'rubygems'
    require 'aliyun'

    options = {
      :access_key_id => "_YOUR_API_KEY_",
      :access_key_secret => "_YOUR_API_SECRET_",
      :service => :ecs
    }

    service = Aliyun::Service.new options
    parameters = {}

    puts service.DescribeRegions parameters

You can create/fetch `access key`/`secret` at [https://i.aliyun.com/access_key](https://i.aliyun.com/access_key)

## Contributing

1. Fork it ( https://github.com/Lax/aliyun/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Author

* [Liu Lantao](https://github.com/Lax)
