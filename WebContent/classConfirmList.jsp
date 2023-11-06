<%@page import="vo.ClassVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/include/header.jsp"></jsp:include>

<%
    List<ClassVO> classConfirmList = (List<ClassVO>)request.getAttribute("classConfirmList");
%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/mypage.css" />
    <meta charset="UTF-8">
    <title>회원 정보 조회 페이지</title>
</head>
<style>
    h2 {
        text-align: center;
        font-size: 25px;
    }
    table {
        align: center;
        background-color: #fff;
/*         border: 1px solid; */
        margin-left: auto;
        margin-right: auto;
    }
</style>
<body>
    <br>
    <br>
    <h2>승인 대기중인 클래스</h2>
    <br>
    <table border=1 style="width:1000px; align:center">
        <tr>
            <th>클래스Id</th>
            <th>카테고리</th>
            <th>클래스이름</th>
            <th>강사Id</th>
            <th>승인하기</th>
            <th>반려하기</th>
        </tr>
        <% int clsSize = classConfirmList.size();
        if(clsSize == 0) { %>
        <tr>
            <td colspan="6" align="center">승인 대기 중인 클래스가 없습니다.</td>
        </tr>
        <% } else {
            for(ClassVO classVO : classConfirmList) {
        %>
        <tr>
            <td align="center"><%=classVO.getClassId()%></td>
            <td><%=classVO.getClassCategory()%></td>
            <td><a href="#"><%=classVO.getClassName()%></td>
            <td><%=classVO.getUserid()%></td>
            <td><button id="confirm-<%=classVO.getClassId()%>">승인</button></td>
            <td data-classid="<%=classVO.getClassId()%>"><button id="return">반려</button></td>
        </tr>
        <% }
        } %>
    </table>

    <!-- ---------------------------클래스 승인 ------------------------------------------------------------------------>
    <script>
        document.querySelectorAll('button[id^="confirm-"]').forEach(function (button) {
            button.addEventListener('click', function () {
                var classId = this.id.split('-')[1];
                updateClassStatus(classId);
            });
        });

        function updateClassStatus(classId) {
            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'ClassConfirm', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                    alert('클래스가 승인되었습니다.');
                    location.reload();
                }
            };
            xhr.send('classId=' + classId);
        }
    </script>

    <!-- ---------------------------클래스 반려 ------------------------------------------------------------------------->
    <script>
        document.querySelectorAll('button[id^="return"]').forEach(function (button) {
            button.addEventListener('click', function () {
                var classId = this.parentNode.getAttribute('data-classid');
                showModal(classId);
            });
        });

        function showModal(classId) {
            var modal = document.getElementById('rejectModal');
            var form = modal.querySelector('form');

            // 모달 창을 열 때 클래스 ID를 입력 폼에 설정합니다.
            form.elements['classId'].value = classId;

            // 모달 창을 표시합니다.
            var bsModal = new bootstrap.Modal(modal);
            bsModal.show();
        }
    </script>

    <!-- 모달 창 -->
    <div class="modal fade" id="rejectModal" tabindex="-1" role="dialog" aria-labelledby="rejectModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="rejectModalLabel">반려 사유 입력</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="rejectForm" method="post" action="RejectClass">
                        <input type="hidden" name="classId" value="">
                        <div class="form-group">
                            <label for="reason">반려 사유:</label>
                            <textarea class="form-control" id="reason" name="reason" rows="3" required></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary" onclick="submitRejectForm()">확인</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function submitRejectForm() {
            var form = document.getElementById('rejectForm');
            var classId = form.elements['classId'].value;
            var reason = form.elements['reason'].value;

            if (reason.trim() === '') {
                alert('반려 사유를 입력하세요.');
                return;
            }

            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'ClassReject', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                    alert('클래스가 반려되었습니다.');
                    var bsModal = bootstrap.Modal.getInstance(document.getElementById('rejectModal'));
                    bsModal.hide();
                    location.reload();
                }
            };
            xhr.send('classId=' + classId + '&reason=' + encodeURIComponent(reason));
        }
    </script>

    <script src="https://unpkg.com/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<jsp:include page="/include/footer.jsp"></jsp:include>
