require './app'
run Sinatra::Application

require 'pdfkit'
use PDFKit::Middleware
