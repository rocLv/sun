require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  def setup
    @user = users(:user_0)
  end

  test "valid user could create successfully" do
    visit new_user_url
    assert_selector "h1", text: "新建用户"

    fill_in 'user[name]', with: 'user'
    fill_in 'user[birthday]', with: '2017-07-08'

    click_button '新建用户'

    assert_selector ".alert-success", text: "用户新建成功"
  end

  test "invalid user birthday format" do
    visit new_user_url
    assert_selector "h1", text: "新建用户"

    fill_in 'user[name]', with: 'user'
    fill_in 'user[birthday]', with: '2017-0708'

    click_button '新建用户'
    assert_selector ".alert-danger", text: "用户创建失败"
  end
end
