task :default => :test

desc "Carga el servidor Sinatra con la aplicacion" 
task :init do

	sh "ruby twitter.rb"
	
end

desc "Instala las gemas necesarias para correr el proyecto"
task :bundle do

	sh "bundle install"

end

desc "Ejecutar test"
task :test do

	sh "ruby test/test.rb"
end	
