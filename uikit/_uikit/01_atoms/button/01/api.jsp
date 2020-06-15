<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); // 한글을 받는경우, 전달되는 파라매터를 UTF-8로 변환함. %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Dstyle uikit : 버튼01</title>
    <link rel="stylesheet" href="button.css">
    <link rel="stylesheet" href="/uikit/_vender/codemirror/lib/codemirror.css" />
    <link rel="stylesheet" href="/uikit/_vender/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/uikit/_vender/bootstrap/css/bootstrap-theme.min.css" />
    <link rel="stylesheet" href="/uikit/_vender/codemirror/theme/dstylePantry.css" />
    <link rel="stylesheet" href="/uikit/_vender/codemirror/custom/codemirror-jspSupport.css" /> <!-- jsp:include , jsp:param 을 이쁘게 만들기 위한 별도커스텀 개발한거 -->

    <script src="/uikit/_vender/jquery/jquery.min.js"></script>
    <script src="/uikit/_vender/lodash/lodash.js"></script>
    <script src="/uikit/_vender/bootstrap/bootstrap.min.js"></script>
    <script src="/uikit/_vender/codemirror/lib/codemirror.js"></script>
    <script src="/uikit/_vender/codemirror/addon/runmode/runmode.js"></script>
    <script src="/uikit/_vender/codemirror/mode/meta.js"></script>
    <script src="/uikit/_vender/codemirror/addon/mode/loadmode.js"></script>
    <script src="/uikit/_vender/codemirror/addon/mode/overlay.js"></script>
    <script src="/uikit/_vender/codemirror/addon/mode/multiplex.js"></script>
    <script src="/uikit/_vender/codemirror/custom/codemirror-jspSupport.js"></script> <!-- jsp:include , jsp:param 을 이쁘게 만들기 위한 별도커스텀 개발한거 -->
    <style>
        .apiExampleList{display:flex;}
        .apiExampleList>li{flex:1;}
        .apiWrapper{width:90%;margin:0 auto;}
        *{list-style:none;margin:0;padding:0;}
        .preview{width:100%;border:0;}
        .previewForm ul{display:flex;}
        .previewForm li{margin-left:20px;}
        .previewForm li:first-child{margin-left:0;}
        .apiDemo,.apiCode,.apiTable{padding-bottom:20px;margin-bottom:20px;border-bottom:1px dashed #333;overflow:hidden;width:100%;}
    </style>
</head>
<body>
<div class="apiWrapper">
    <section class="apiHeader">
        <h1>버튼 01</h1>
        <p>사각형태의 기본 버튼 형태 입니다.</p>
    </section>
    <section class="apiDemo">
        <h3>Demo</h3>
        <form action="demo.jsp" target="api" method="post" id="props" class="previewForm">
            <ul>
                <li class="form-group">
                    <label for="opt0">color</label>
                    <select name="color" id="opt0" class="form-control">
                        <option value="">기본</option>
                        <option value="gray">gray</option>
                        <option value="darkGray">darkGray</option>
                        <option value="brand">brand</option>
                        <option value="subBrand">subBrand</option>
                        <option value="white">white</option>
                        <option value="disabled">disabled</option>
                    </select>
                </li>
                <li class="form-group">
                    <label for="opt1">size</label>
                    <select name="size" id="opt1" class="form-control">
                        <option value="">기본</option>
                        <option value="xs">xs</option>
                        <option value="sm">sm</option>
                        <option value="nm">nm</option>
                        <option value="lg">lg</option>
                        <option value="xl">xl</option>
                    </select>
                </li>
                <li class="form-group">
                    <label for="opt2">display</label>
                    <select name="display" id="opt2" class="form-control">
                        <option value="">기본</option>
                        <option value="inline">inline</option>
                        <option value="inline-block">inline-block</option>
                        <option value="block">block</option>
                    </select>
                </li>
                <li class="form-group">
                    <label for="opt3">text</label>
                    <input type="text" name="text" id="opt3" value="버튼" class="form-control" />
                </li>
            </ul>
        </form>
        <script>
            $(function(){
                $("#props select").on("change",function(){
                    $("#props").submit();
                });
                $("#props input").on("keyup",function(){
                    $("#props").submit();
                });
            });
        </script>
        <iframe src="demo.jsp" frameborder="0" name="api" id="api" class="preview"></iframe>
    </section>

    <section class="apiCode">
        <h3>선언코드(기본값)</h3>
<pre><code class="language-jsp">
&lt;jsp:include page="test.jsp">
    &lt;jsp:param name="href" value="#">&lt;/jsp:param>
    &lt;jsp:param name="target" value="">&lt;/jsp:param>
    &lt;jsp:param name="title" value="">&lt;/jsp:param>
    &lt;jsp:param name="tabIndex" value="">&lt;/jsp:param>
    &lt;jsp:param name="id" value="">&lt;/jsp:param>
    &lt;jsp:param name="text" value="버튼">&lt;/jsp:param>
    &lt;jsp:param name="color" value="gray">&lt;/jsp:param>
    &lt;jsp:param name="size" value="nm">&lt;/jsp:param>
    &lt;jsp:param name="display" value="inline-block">&lt;/jsp:param>
    &lt;jsp:param name="style" value="">&lt;/jsp:param>
&lt;/jsp:include>
</code></pre>
        <script>
            $(function(){
                /////////////////////////
                // CodeMirror
                CodeMirror.modeURL = '/uikit/_vender/codemirror/mode/%N/%N.js';
                var codeBlocks = document.querySelectorAll('pre > code');

                function parseMode(mode) {
                    let syntax = CodeMirror.findModeByName(mode);
                    if (syntax == null) syntax = CodeMirror.findModeByName('Plain Text');
                    return syntax;
                }

                _.forEach(codeBlocks, block => {
                    var syntax = parseMode(block.className.substring(9));
                CodeMirror.requireMode(syntax.mode, () => {
                    var value = _.unescape(block.innerHTML);
                block.innerHTML = '';
                block.parentNode.className = 'cm-s-dstylePantry CodeMirror';
                CodeMirror.runMode(value, syntax.mime, block, {
                    tabSize: 2
                });
                CodeMirror.jspSupport(block); // jsp:include 와 jsp:param 에 대해 : 을기준으로 별도 태그분리
                block.style.visibility = 'visible';
            });
            });
            });
        </script>
    </section>

    <section class="apiTable">
    <h2>API 표 (jsp:param)</h2>
    <table class="table">
        <thead class="thead-dark">
        <tr>
            <th>파라매터명</th>
            <th>데이터형식</th>
            <th>데이터범위</th>
            <th>기본값</th>
            <th>설명</th>
        </tr>
        </thead>
        <tbody>
        <tr class="bg-success">
            <td>href</td>
            <td>String</td>
            <td>*</td>
            <td>"#"</td>
            <td>버튼링크의 "href" 어트리뷰트의 값, "" 로 지정 할경우 span 엘리먼트로 대체 됨</td>
        </tr>
        <tr>
            <td>target</td>
            <td>String</td>
            <td>*</td>
            <td>""</td>
            <td>버튼링크의 "target" 어트리뷰트의 값, "" 로 지정 할경우 어트리뷰트 미적용됨</td>
        </tr>
        <tr>
            <td>title</td>
            <td>String</td>
            <td>*</td>
            <td>""</td>
            <td>버튼링크의 "title" 어트리뷰트의 값, "" 로 지정 할경우 어트리뷰트 미적용됨</td>
        </tr>
        <tr>
            <td>tabIndex</td>
            <td>String</td>
            <td>*</td>
            <td>""</td>
            <td>버튼링크의 "tabIndex" 어트리뷰트의 값, "" 로 지정 할경우 어트리뷰트 미적용됨</td>
        </tr>
        <tr>
            <td>id</td>
            <td>String</td>
            <td>*</td>
            <td>""</td>
            <td>버튼링크의 "id" 어트리뷰트의 값, "" 로 지정 할경우 어트리뷰트 미적용됨</td>
        </tr>
        <tr>
            <td>text</td>
            <td>String</td>
            <td>*</td>
            <td>"버튼"</td>
            <td>버튼 링크 내 글자</td>
        </tr>
        <tr class="bg-success">
            <td>color</td>
            <td>String</td>
            <td>gray, darkGray, brand, subBrand, white, disabled</td>
            <td>gray</td>
            <td>버튼의 색상변경</td>
        </tr>
        <tr class="bg-success">
            <td>size</td>
            <td>String</td>
            <td>xs, sm, nm, lg, xl</td>
            <td>nm</td>
            <td>버튼의 크기변경</td>
        </tr>
        <tr>
            <td>display</td>
            <td>String</td>
            <td>block, inline-block, inline</td>
            <td>inline-block</td>
            <td>버튼링크의 display 속성</td>
        </tr>
        <tr>
            <td>style</td>
            <td>String</td>
            <td>*</td>
            <td>""</td>
            <td>버튼링크의 "style" 어트리뷰트의 값, "" 로 지정 할경우 어트리뷰트 미적용됨</td>
        </tr>
        </tbody>
    </table>
    </section>
</div>
</body>
</html>