<?php

namespace common\models\common\base;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\common\base\Suggestion;

/**
 * SuggestionSearch represents the model behind the search form about `common\models\common\base\Suggestion`.
 */
class SuggestionSearch extends Suggestion
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'type', 'uid', 'addtime', 'status', 'isdel'], 'integer'],
            [['tel', 'name', 'email', 'content', 'remark'], 'safe'],
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
        $query = Suggestion::find();

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
            'type' => $this->type,
            'uid' => $this->uid,
            'addtime' => $this->addtime,
            'status' => $this->status,
            'isdel' => $this->isdel,
        ]);

        $query->andFilterWhere(['like', 'tel', $this->tel])
            ->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'email', $this->email])
            ->andFilterWhere(['like', 'content', $this->content])
            ->andFilterWhere(['like', 'remark', $this->remark]);
       
        $query->orderBy('id desc');
        return $dataProvider;
    }
}
