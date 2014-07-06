<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="http://fonts.googleapis.com/css?family=Oswald" rel="stylesheet" type="text/css" />
    <link href="/static/default.css" rel="stylesheet" type="text/css" media="all" />

    %if defined('title'):
      <title>
        {{title}}
      </title>
    %end
    <!-- <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1, maximum-scale=1"> -->
    %include('styles.tpl')
</head>
<body>
  %if defined('message'):
  {{message}}
  %end

  %if defined('title'):
    <div id="header">
      <div id="logo">
        <h1><a href="/"><span>VETS</span> (Volunteer Effort Tracking System)</a></h1>
        <p>{{title}}</p>
      </div>
    </div>
  %end

  %if defined('nav'):
    %include('nav.tpl', nav=nav)
  %end

  {{!base}}

</body>
</html>
