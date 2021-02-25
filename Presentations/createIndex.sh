
cat << EOF > index.html
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">



    <title>List of presentations</title>
    <link href="https://fonts.googleapis.com/css2?family=Fira+Code:wght@400;700&display=swap" rel="stylesheet">
    <style>
        html,
        body {
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Fira Code', monospace;
            font-size: 18px;
        }

        main {
            padding: 1em;
        }

        img {
            width: 100%;
                    margin-left:1%;
        }

        .list-inline {
            padding: 0;
        }

        .list-inline>li {
            list-style: none;
            display: inline;
        }

        .list-inline>li:not(:last-child):after {
            content: ", ";
        }

        @media(min-width: 768px) {
            body>main>header>img {
                width: 19%;
                position: fixed;
                left: 0;
                top: 0;
            }

            body>main {
                margin-left: 21%;
            }
 @media(max-width: 768px) {
                body {
                        font-size: 14px;
                }
        }
        .l {
                float:left;
                }

        .r {
          float: right;
        }
        li{
  margin: 10px 0;
        }
    </style>
</head>

<body>
    <main>
        <header>
	<h2>Here you can see a list of my presentations</h2>
	<br>
EOF

for i in $(ls -d */);do
	title=$(grep "<title>" $i/index.html|awk -F "<title>" '{print $2}'|awk -F "</title>" '{print $1}')	
	echo '<br><li><a href="'"$i"'">'"$title"'</a><br>'>>index.html
done

cat << EOF >> index.html
</header>
        </main>
  </body>
</html>
EOF



