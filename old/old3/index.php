<?php $title = "Hikaru's House"; require("header.php"); ?>

<h1>Hikaru's House</h1>
<h2>ENJOY YOUR LIFE!</h2><br>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
<script>
$(function(){
    var $setElm = $('.topViewer'),
    fadeSpeed = 1500,
    switchDelay = 5000;
    $setElm.each(function(){
        var targetObj = $(this);
        var findUl = targetObj.find('ul');
        var findLi = targetObj.find('li');
        var findLiFirst = targetObj.find('li:first');
        findLi.css({display:'block',opacity:'0',zIndex:'99'});
        findLiFirst.css({zIndex:'100'}).stop().animate({opacity:'1'},fadeSpeed);
        setInterval(function(){
            findUl.find('li:first-child').animate({opacity:'0'},fadeSpeed).next('li').css({zIndex:'100'}).animate({opacity:'1'},fadeSpeed).end().appendTo(findUl).css({zIndex:'99'});
        },switchDelay);
    });
});
</script>


<div class="topViewer">
<ul>
<li><img src="fig/topFigure.png" width="584" height="324" alt=""></li>
<li><img src="fig/topFigure2.png" width="584" height="324" alt=""></li>
<li><img src="fig/topFigure3.png" width="584" height="324" alt=""></li>
<li><img src="fig/topFigure4.png" width="584" height="324" alt=""></li>
<li><img src="fig/topFigure5.png" width="584" height="324" alt=""></li>
</ul>
</div><!--/.topViewer-->

<div class="main_message">
<p>
ここはヒカル(<a href="https://twitter.com/hikaru_nikki">@hikaru_nikki</a>)が自分の趣味のために作成したサイトです。<br>
主に高校生向け物理を解説しています。<br>
最近では高校数学とかにも手をだす予定です。<br>
ご意見・ご質問があれば、上のアカウントまでご連絡ください。
</p>
</div>
<br>
<h3>News &amp Topics</h3><br>
<div class="scroll">
<p>
2013.12.10<br>
<a href="highschool.php">High School</a>に数列を追加しました。<br>
<br>
2013.12.08<br>
<a href="highschool.php">High School</a>に行列を追加しました。<br>
<br>
2013.11.21<br>
<a href="highschool.php">High School</a>に原子物理を追加しました。<br>
<br>
2013.8.30<br>
<a href="highschool.php">High School</a>のPDFを一新しました。<br>
<br>
2013.8.14<br>
トップ画像の調整を行いました。<br>
今後もサイトをこまめに修正していきます。<br>
<br>
2013.8.11<br>
サイトのデザインを大幅改修しました。<br>
<br>
2013.8.7<br>
<a href="highschool.php">High School</a>に高校生向けのPDFをアップロードしました。<br>
ただしパスワード付きです。ご了承ください。<br>
パスはつながりのある方に個人的にお教えしています。<br>
<br>
2013.6.25<br>
引越ししました。<br>
ここからまた始めます。<br>
</p>
</div>
<?php require("footer.php"); ?>
