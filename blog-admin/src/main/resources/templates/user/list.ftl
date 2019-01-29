<#include "/include/macros.ftl">
<@header></@header>
<div class="clearfix"></div>
<div class="row">
  <div class="col-md-12 col-sm-12 col-xs-12">
    <ol class="breadcrumb">
      <li><a href="/">首页</a></li>
      <li class="active">用户管理</li>
    </ol>
    <div class="x_panel">
      <div class="x_content">
        <div class="<#--table-responsive-->">
          <div class="btn-group hidden-xs" id="toolbar">
                        <@shiro.hasPermission name="user:add">
                        <button id="btn_add" type="button" class="btn btn-default" title="新增用户">
                          <i class="fa fa-plus"></i> 新增用户
                        </button>
                        </@shiro.hasPermission>
                        <@shiro.hasPermission name="user:batchDelete">
                            <button id="btn_delete_ids" type="button" class="btn btn-default" title="删除选中">
                              <i class="fa fa-trash-o"></i> 批量删除
                            </button>
                        </@shiro.hasPermission>
          </div>
          <table id="tablelist">
          </table>
        </div>
      </div>
    </div>
  </div>
</div>
<!--弹框-->
<div class="modal fade bs-example-modal-sm" id="selectRole" tabindex="-1" role="dialog"
     aria-labelledby="selectRoleLabel">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
            aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="selectRoleLabel">分配角色</h4>
      </div>
      <div class="modal-body">
        <form id="boxRoleForm">
          <div class="zTreeDemoBackground left">
            <ul id="treeDemo" class="ztree"></ul>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-close"> 关闭</i></button>
      </div>
    </div>
  </div>
</div>
<!--/弹框-->
<!--添加用户弹框-->
<div class="modal fade" id="addOrUpdateModal" tabindex="-1" role="dialog" aria-labelledby="addroleLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
            aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="addroleLabel">添加用户</h4>
      </div>
      <div class="modal-body">
        <form id="addOrUpdateForm" class="form-horizontal form-label-left" novalidate>
          <input type="hidden" name="id">
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="username">用户名: <span class="required">*</span></label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" class="form-control col-md-7 col-xs-12" name="username" id="username"
                     required="required" placeholder="请输入用户名"/>
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="password">密码: <span class="required">*</span></label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="password" class="form-control col-md-7 col-xs-12" id="password" name="password"
                     required="required" placeholder="请输入密码 6位以上"/>
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="nickname">昵称:</label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" class="form-control col-md-7 col-xs-12" name="nickname" id="nickname"
                     placeholder="请输入昵称"/>
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="title">头像 <span
                class="required">*</span></label>
            <div class="col-md-3 col-sm-3 col-xs-3">
              <div class="choose-local-img">
                <button type="button" class="btn btn-success" id="file-upload-btn">上传图片</button>
                <input id="cover-img-file" type="file" name="avaratFile" required="required" style="display: none">
                <input id="cover-img-input" type="hidden" name="avatarFileUrl">
                <div class="preview">
                  <img class="coverImage" src="" alt="">
                </div>
              </div>
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="mobile">手机:</label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="tel" class="form-control col-md-7 col-xs-12" name="mobile" id="mobile"
                     data-validate-length-range="6,20" placeholder="请输入手机号"/>
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">邮箱:</label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="email" class="form-control col-md-7 col-xs-12" name="email" id="email" placeholder="请输入邮箱"/>
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="qq">QQ:</label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="number" class="form-control col-md-7 col-xs-12" name="qq" id="qq" placeholder="请输入QQ"/>
            </div>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-close"> 关闭</i></button>
        <button type="button" class="btn btn-success addOrUpdateBtn"><i class="fa fa-save"> 保存</i></button>
      </div>
    </div>
  </div>
</div>
<!--/添加用户弹框-->

<!--上传图片弹框-->
<div class="modal fade" id="chooseImg" tabindex="-1" role="dialog" aria-labelledby="addroleLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
            aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="addroleLabel">选择图片</h4>
      </div>
      <div class="modal-body">
        <div class="" role="tabpanel" data-example-id="togglable-tabs">
          <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
            <li role="presentation" class="">
              <a href="#tab_content1" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="true">本地图片</a>
            </li>
          </ul>
          <div id="myTabContent" class="tab-content">
            <div role="tabpanel" class="tab-pane fade" id="tab_content1" aria-labelledby="profile-tab">
              <button type="button" class="btn btn-success" id="file-btn">选择图片</button>
              <div class="preview" class="fa-2x">
                <img class="coverImage" src="" alt="">
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-close"> 关闭</i></button>
        <button type="button" class="btn btn-success uploadAvatal" data-dismiss="modal"><i class="fa fa-hand-o-up"> 确定</i></button>
      </div>
    </div>
  </div>
</div>
<!--上传图片弹框-->

<@footer>
    <script>
      /**
       * 操作按钮
       * @param code
       * @param row
       * @param index
       * @returns {string}
       */
      function operateFormatter(code, row, index) {
        var currentUserId = '${user.id}';
        var trUserId = row.id;
        var operateBtn = [
          '<@shiro.hasPermission name="user:edit"><a class="btn btn-xs btn-primary btn-update" data-id="' + trUserId
          + '"><i class="fa fa-edit"></i>编辑</a></@shiro.hasPermission>',
        ];
        if (currentUserId != trUserId) {
          operateBtn.push(
          '<@shiro.hasPermission name="user:delete"><a class="btn btn-xs btn-danger btn-remove" data-id="' + trUserId
              + '"><i class="fa fa-trash-o"></i>删除</a></@shiro.hasPermission>');
          operateBtn.push(
          '<@shiro.hasPermission name="user:allotRole"><a class="btn btn-xs btn-info btn-allot" data-id="' + trUserId
              + '"><i class="fa fa-circle-thin"></i>分配角色</a></@shiro.hasPermission>')
        }
        return operateBtn.join('');
      }

      $(function () {
        var options = {
          url: "/user/list",
          getInfoUrl: "/user/get/{id}",
          updateUrl: "/user/edit",
          removeUrl: "/user/remove",
          createUrl: "/user/add",
          saveRolesUrl: "/user/saveUserRoles",
          columns: [
            {
              checkbox: true
            }, {
              field: 'username',
              title: '用户名',
              editable: false,
            }, {
              field: 'nickname',
              title: '昵称',
              editable: true
            }, {
              field: 'email',
              title: '邮箱',
              editable: true
            }, {
              field: 'qq',
              title: 'qq',
              editable: true
            }, {
              field: 'userType',
              title: '用户类型',
              editable: false
            }, {
              field: 'statusEnum',
              title: '状态',
              editable: false
            }, {
              field: 'lastLoginTime',
              title: '最后登录时间',
              editable: false,
              formatter: function (code) {
                return new Date(code).format("yyyy-MM-dd hh:mm:ss")
              }
            }, {
              field: 'loginCount',
              title: '登录次数',
              editable: false
            }, {
              field: 'operate',
              title: '操作',
              formatter: operateFormatter //自定义方法，添加操作按钮
            }
          ],
          modalName: "用户"
        };
        //1.初始化Table
        $.tableUtil.init(options);
        //2.初始化Button的点击事件
        $.buttonUtil.init(options);

        /* 分配用户角色 */
        $('#tablelist').on('click', '.btn-allot', function () {
          console.log("分配权限");
          var $this = $(this);
          var userId = $this.attr("data-id");
          $.ajax({
            async: false,
            type: "POST",
            data: {uid: userId},
            url: '/roles/rolesWithSelected',
            dataType: 'json',
            success: function (json) {
              var data = json.data;
              console.log(data);
              var setting = {
                check: {
                  enable: true,
                  chkboxType: {"Y": "ps", "N": "ps"},
                  chkStyle: "radio"
                },
                data: {
                  simpleData: {
                    enable: true
                  }
                },
                callback: {
                  onCheck: function (event, treeId, treeNode) {
                    console.log(treeNode.tId + ", " + treeNode.name + "," + treeNode.checked);
                    var treeObj = $.fn.zTree.getZTreeObj(treeId);
                    var nodes = treeObj.getCheckedNodes(true);
                    var ids = new Array();
                    for (var i = 0; i < nodes.length; i++) {
                      //获取选中节点的值
                      ids.push(nodes[i].id);
                    }
                    console.log(ids);
                    console.log(userId);
                    $.post(options.saveRolesUrl, {"userId": userId, "roleIds": ids.join(",")}, function (obj) {
                    }, 'json');
                  }
                }
              };
              var tree = $.fn.zTree.init($("#treeDemo"), setting, data);
              tree.expandAll(true);//全部展开

              $('#selectRole').modal('show');
            }
          });
        });


        // 选择图片
        $("#file-upload-btn").click(function () {
          $("#chooseImg").modal('show');
        });

        $("#file-btn").click(function () {
          var $this = $(this);
          $("#cover-img-file").click();
        });
        $("input[name=avaratFile]").uploadPreview({imgContainer: ".preview", width: 190, height: 200});

        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        // 上传头像
        $('.uploadAvatal').click(function uploadAvatar() {
          var form = new FormData(),
              url = '/api/upload2Qiniu', //服务器上传地址
              file = ($("input[name=avaratFile]")[0].files)[0];
          form.append('file', file);
          var xhr = new XMLHttpRequest();
          xhr.open("post", url, true);
          xhr.onreadystatechange = function () {
            var result = xhr;
            if (xhr.readyState == 4) {
              var resultData = xhr.responseText;
              var json = eval("(" + resultData + ")");
              $(".avatarFileUrl").val(json.data.filePath);
            }
          }
          xhr.setRequestHeader(header, token);
          xhr.send(form); //开始上传
        });
      });
    </script>
</@footer>