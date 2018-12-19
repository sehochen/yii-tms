<?php
namespace wokaextend\components\common\game;

/**
 * Summary of RedPacket
 * 红包类
 * @author vanzer 
 * @dataProvider 2017-10-16
 */
class RedPacket
{    

    public $rewardMoney;        #红包金额、单位元
    public $rewardNum;                  #红包数量
    public $scatter;            #分散度值1-10000
    public $rewardArray;        #红包结果集
    
    #初始化红包类
    public function __construct()
    {
        $this->rewardArray=array();
    }
    
    #执行红包生成算法
    public function splitReward($rewardMoney,$rewardNum,$scatter=100)
    {
        #传入红包金额和数量
        $this->rewardMoney=$rewardMoney;
        $this->rewardNum=$rewardNum;
        $this->scatter=$scatter;
        $this->realscatter=$this->scatter/100;
          
        #计算出发出红包的平均概率值、精确到小数4位。即上面的1/N值。
        $avgRand=round(1/$this->rewardNum,4);
      
        $randArr=array();
        while(count($randArr)<$rewardNum)
        {
            $t=round(sqrt(mt_rand(1,10000)/$this->realscatter));
            $randArr[]=$t;
        }
        
        #计算当前生成的随机数的平均值，保留4位小数
        $randAll=round(array_sum($randArr)/count($randArr),4);
        
        #为将生成的随机数的平均值变成我们要的1/N，计算一下生成的每个随机数都需要除以的值。我们可以在最后一个红包进行单独处理，所以此处可约等于处理。
        $mixrand=round($randAll/$avgRand,4);
        
        #对每一个随机数进行处理，并剩以总金额数来得出这个红包的金额。
        $rewardArr=array();
        foreach($randArr as $key=>$randVal)
        {
            $randVal=round($randVal/$mixrand,4);
            $rewardArr[]=round($this->rewardMoney*$randVal,2);
        }
        
        #对比红包总数的差异、修正最后一个大红包
        sort($rewardArr);
        $rewardAll=array_sum($rewardArr);
        $rewardArr[$this->rewardNum-1]=$this->rewardMoney-($rewardAll-$rewardArr[$this->rewardNum-1]);
        rsort($rewardArr);

        #对红包进行排序一下以方便在前台图示展示
        foreach($rewardArr as $k=>$value)
        {
            $t=$k%2;
            if($t) array_push($this->rewardArray,$value);
            else array_unshift($this->rewardArray,$value);
        }
		
        $rewardArr=NULL;
		  shuffle( $this->rewardArray);
        return $this->rewardArray;
    }
    
}
?>