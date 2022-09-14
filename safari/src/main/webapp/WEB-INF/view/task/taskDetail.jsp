<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- User new mail right area -->
<div class="kanban-sidebar">
    <div class="card shadow-none quill-wrapper">
        <div class="card-header d-flex justify-content-between align-items-center border-bottom px-2 py-1">
            <h3 class="card-title">UI Design</h3>
            <button type="button" class="close close-icon">
                <i class="feather icon-x"></i>
            </button>
        </div>
        <!-- form start -->
        <form class="edit-kanban-item">
            <div class="card-content position-relative">
                <div class="card-body">
                    <div class="form-group">
                        <label>Card Title</label>
                        <input type="text" class="form-control edit-kanban-item-title" placeholder="kanban Title">
                    </div>
                    <div class="form-group">
                        <label>Due Date</label>
                        <input type="text" class="form-control edit-kanban-item-date" placeholder="21 August, 2019">
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label>Label</label>
                                <select class="form-control text-white">
                                    <option class="bg-primary" selected>Primary</option>
                                    <option class="bg-danger">Danger</option>
                                    <option class="bg-success">Success</option>
                                    <option class="bg-info">Info</option>
                                    <option class="bg-warning">Warning</option>
                                    <option class="bg-secondary">Secondary</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label>Member</label>
                                <div class="d-flex align-items-center">
                                    <div class="avatar m-0 mr-1">
                                        <img src="../../../app-assets/images/portrait/small/avatar-s-20.png" height="36" width="36" alt="avtar img holder">
                                    </div>
                                    <div class="badge-circle">
                                        <i class="feather icon-plus"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Attachment</label>
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="emailAttach">
                            <label class="custom-file-label" for="emailAttach">Attach file</label>
                        </div>
                    </div>
                    <!-- Compose mail Quill editor -->
                    <div class="form-group">
                        <label>Comment</label>
                        <div class="snow-container border rounded p-1">
                            <div class="compose-editor"></div>
                            <div class="d-flex justify-content-end">
                                <div class="compose-quill-toolbar">
                                    <span class="ql-formats mr-0">
                                        <button class="ql-bold"></button>
                                        <button class="ql-italic"></button>
                                        <button class="ql-underline"></button>
                                        <button class="ql-link"></button>
                                        <button class="ql-image"></button>
                                        <button class="btn btn-sm btn-primary btn-comment ml-25">Comment</button>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-footer d-flex justify-content-end">
                <button type="reset" class="btn btn-danger delete-kanban-item mr-1">
                    <i class='feather icon-trash-2 mr-50'></i>
                    <span>Delete</span>
                </button>
                <button class="btn btn-primary glow update-kanban-item">
                    <i class='feather icon-play mr-50'></i>
                    <span>Save</span>
                </button>
            </div>
        </form>
        <!-- form start end-->
    </div>
</div>
<!--/ User Chat profile right area -->