<?php

namespace common\models\common\wechat;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\common\wechat\WechatAccount;

/**
 * WechatAccountSearch represents the model behind the search form about `common\models\common\wechat\WechatAccount`.
 */
class WechatAccountSearch extends WechatAccount
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id'], 'integer'],
            [['title', 'wechatToken', 'wechatUrl', 'wechatAPPID', 'wechatAPPSecret', 'encodingAesKey', 'wechatPic'], 'safe'],
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
        $query = WechatAccount::find();

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
        ]);

        $query->andFilterWhere(['like', 'title', $this->title])
            ->andFilterWhere(['like', 'wechatToken', $this->wechatToken])
            ->andFilterWhere(['like', 'wechatUrl', $this->wechatUrl])
            ->andFilterWhere(['like', 'wechatAPPID', $this->wechatAPPID])
            ->andFilterWhere(['like', 'wechatAPPSecret', $this->wechatAPPSecret])
            ->andFilterWhere(['like', 'encodingAesKey', $this->encodingAesKey])
            ->andFilterWhere(['like', 'wechatPic', $this->wechatPic]);

        return $dataProvider;
    }
}
