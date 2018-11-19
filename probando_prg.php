<?php

?>

<!DOCTYPE html>
<html>
<head>
	<title>PRG in PHP</title>
</head>
<body>
	<p>See <a href="http://blog.shamess.info/2012/01/06/postrequestget-pattern-in-php/">my blog</a> for more information.</p>
	
	<form method="get" action="probando_prg.php">
		<p>This is a form, that will submit data back to this page using POST.</p>
		<p>Enter a value for $_POST['some_text']: <input type="text" name="some_text" /></p>
		<p><input type="submit" name="submit"/></p>
	</form>
</body>
</html>