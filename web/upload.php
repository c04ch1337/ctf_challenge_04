<?php
if ($_FILES['file']['name']) {
    move_uploaded_file($_FILES['file']['tmp_name'], "uploads/" . $_FILES['file']['name']);
    echo "<p>File uploaded!</p>";
} else {
    echo "<form method='post' enctype='multipart/form-data'>
        <input type='file' name='file'>
        <input type='submit' value='Upload'>
    </form>";
}
?>
