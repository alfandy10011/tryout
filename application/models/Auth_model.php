<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Auth_model extends CI_Model
{
  public function __construct()
  {
    $this->load->model('Group_model', 'group');
  }
  public function register($user)
  {

    $username = $user['username'];
    $fullname = $user['fullname'];
    $school = $user['school'];
    $email = $user['email'];
    $password = $user['password'];

    $group = $this->group->get_student_id();
    $res = $this->ion_auth->register($username, $password, $email, [null], [$group]);
    return $res;
  }
}
