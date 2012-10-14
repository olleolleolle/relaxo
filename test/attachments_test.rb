#!/usr/bin/env ruby

require 'helper'

require 'relaxo'
require 'relaxo/attachments'

class DatabaseTest < Test::Unit::TestCase
	def setup
		@connection = Relaxo::Connection.new(TEST_DATABASE_HOST)
		@database = Relaxo::Database.new(@connection, TEST_DATABASE_NAME)
		
		if @database.exist?
			@database.delete!
		end
		
		@database.create!
	end
	
	def test_attachments
		document = {
			Relaxo::ATTACHMENTS => {
				"foo.txt" => {
					"content_type" => "text\/plain",
					"data" => "VGhpcyBpcyBhIGJhc2U2NCBlbmNvZGVkIHRleHQ="
				}
			}
		}
		
		puts @database.save(document).inspect
	end
end