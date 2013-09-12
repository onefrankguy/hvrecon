all: test

test: hvrecon.zip
	find *.zip -size -13312c -print

hvrecon.zip: *.html img/*.png
	zip hvrecon.zip *.html img/*.png

clean:
	rm -rf hvrecon.zip
