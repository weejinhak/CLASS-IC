<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="myinfo" value="${myinfo}" />

      <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                                <i class="material-icons">clear</i>
                                                            </button>
                                                            <h4 class="modal-title">회원정보 수정</h4>
                                                        </div>
                                                        <div class="modal-body">
                                      <div class="card">
                                      <div class="card-content">
                                      <form class="form-horizontal">
                                        <div class="row">
                                            <label class="col-md-3 label-on-left">Email</label>
                                            <div class="col-md-9">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label"></label>
                                                    <input type="email" class="form-control" name="email" id="email" readonly="readonly" value="${myinfo.email }">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="col-md-3 label-on-left">이름</label>
                                            <div class="col-md-9">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label"></label>
                                                    <input type="text" class="form-control" name="name" id="name" readonly="readonly" value="${myinfo.name}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="col-md-3 label-on-left">비밀번호</label>
                                            <div class="col-md-9">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label"></label>
                                                    <input type="password" class="form-control" name="pwd" id="pwd">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="col-md-3 label-on-left">비밀번호 확인</label>
                                            <div class="col-md-9">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label"></label>
                                                    <input type="password" class="form-control"name="pwdconfirm" id="pwdconfirm">
                                                </div>
                                            </div>
                                        </div>
                                         <div class="row">
                                            <label class="col-md-3 label-on-left">전화번호</label>
                                            <div class="col-md-9">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label"></label>
                                                    <input type="text" class="form-control" name="phone" id="phone" value="${myinfo.phone}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="col-md-3"></label>
                                            <div class="col-md-9">
                                                <div class="form-group form-button">
                                                    <button type="submit" class="btn btn-fill btn-rose" id="editMyInfo">회원정보 수정</button>
                                                    <button type="button" class="btn btn-fill" data-dismiss="modal">취소</button>
                                                    <button type="submit" class="btn btn-fill btn-warning">회원 탈퇴</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                  </div>                      
                                  </div>
                                </div> 