<?php

namespace common\models\common\cash;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\common\cash\CashWithdraw;

/**
 * CashWithdrawSearch represents the model behind the search form about `common\models\common\cash\CashWithdraw`.
 */
class CashWithdrawSearch extends CashWithdraw
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'uid', 'status', 'time', 'retime'], 'integer'],
            [['money'], 'number'],
            [['content', 'openid'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = CashWithdraw::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'uid' => $this->uid,
            'money' => $this->money,
            'status' => $this->status,
            'time' => $this->time,
            'retime' => $this->retime,
        ]);

        $query->andFilterWhere(['like', 'content', $this->content])
            ->andFilterWhere(['like', 'openid', $this->openid]);

        return $dataProvider;
    }
}
