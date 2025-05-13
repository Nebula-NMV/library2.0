<?php 
session_start();

require_once __DIR__ . '/../connect.php';

if (isset($_POST['cancel'])) {
    if(!empty($_POST['history_id'])){
        $history_id = $connect->real_escape_string($_POST['history_id']);
        $sql = "UPDATE history SET status = 'cancel' WHERE history_id = '$history_id'";
        $result = $connect->query($sql);
        if($result){
            echo "suscess";
            $_SESSION['alert'] = 'success';
            header("Location: ../../public/moderator/status.php");
            exit();
        }else{
            echo "unsussess";
            $_SESSION['alert'] = 'unsuccess';
            header("Location: ../../public/moderator/status.php");
            exit();
        }
        }else{
            echo "unsussess";
            $_SESSION['alert'] = 'unsuccess';
            header("Location: ../../public/moderator/status.php");
            exit();
        }
    }




    if (isset($_POST['return'])) {
        if(!empty($_POST['history_id'])){
            $history_id = $connect->real_escape_string($_POST['history_id']);
            $sql = "UPDATE history SET status = 'returned' WHERE history_id  = '$history_id'";
            $result = $connect->query($sql);
            if($result){
                echo "suscess";
                $_SESSION['alert'] = 'success';
                header("Location: ../../public/moderator/status.php");
                exit();
            }else{
                echo "unsussess";
                $_SESSION['alert'] = 'unsuccess';
                header("Location: ../../public/moderator/status.php");
                exit();
            }
        }else{
            echo "unsussess";
            $_SESSION['alert'] = 'unsussess';
            header("Location: ../../public/moderator/status.php");
            exit();
        }
    }



    if (isset($_POST['missing'])) {
        if(!empty($_POST['history_id'])){
            $history_id = $connect->real_escape_string($_POST['history_id']);
            $sql = "UPDATE history SET status = 'missing' WHERE history_id = '$history_id'";
            $result = $connect->query($sql);
            if($result){
                echo "suscess";
                $_SESSION['alert'] = 'success';
                header("Location: ../../public/moderator/status.php");
                exit();
            }else{
                echo "unsussess";
                $_SESSION['alert'] = 'unsuccess';
                header("Location: ../../public/moderator/status.php");
                exit();
            }
        }else{
            echo "unsussess";
            $_SESSION['alert'] = 'unsuccess';
            header("Location: ../../public/moderator/status.php");
            exit();
        }
    }


    
?>