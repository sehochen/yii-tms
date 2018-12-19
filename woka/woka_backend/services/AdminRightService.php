<?php
namespace backend\services;

use common\models\common\rbac\RbacAdminRight;

class AdminRightService extends RbacAdminRight{

    public function getAllRight(){
        $sql = "SELECT m.id AS mid, m.display_label AS m_name, f.id AS fid, f.code, f.menu_name AS f_name, r.id AS rid, r.right_name AS r_name FROM
        wokav_rbac_admin_module m LEFT JOIN wokav_rbac_admin_menu f ON f.module_id = m.id
        LEFT JOIN wokav_rbac_admin_right r ON r.menu_id = f.id";
        //$connection = Yii::$app->db;
        $connection = $this->getDb();
        $command=$connection->createCommand($sql);
        $rows=$command->queryAll();
        //         $rows=$dataReader->readAll();
        return $rows;
    }
}
