<?php

namespace common\models\project\suso\tms;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\project\suso\tms\SusoOrder;

/**
 * SusoOrderSearch represents the model behind the search form about `common\models\project\suso\tms\SusoOrder`.
 */
class SusoOrderSearchYingshou extends SusoOrder
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'from_id', 'status'], 'integer'],
            [['order_sn', 'transport_number', 'order_date', 'shipping_date', 'destination', 'product', 'tonnage', 'remarks', 'plate_number', 'driver', 'driver_id', 'driver_tel', 'assistant', 'assistant_id', 'carrier', 'carrier_tel', 'customer', 'customer_user', 'customer_address', 'customer_tel', 'remakes_control', 'jydate', 'yjdate', 'realdate', 'reback'], 'safe'],
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
        $query = SusoOrder::find();

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
        $statusQx=[1,20,-2];
        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'from_id' => $this->from_id,
            'status' => $this->status,
            'status' =>$statusQx,
        ]);

        $query->andFilterWhere(['like', 'order_sn', $this->order_sn])
            ->andFilterWhere(['like', 'transport_number', $this->transport_number])
            ->andFilterWhere(['like', 'order_date', $this->order_date])
            ->andFilterWhere(['like', 'shipping_date', $this->shipping_date])
            ->andFilterWhere(['like', 'destination', $this->destination])
            ->andFilterWhere(['like', 'product', $this->product])
            ->andFilterWhere(['like', 'tonnage', $this->tonnage])
            ->andFilterWhere(['like', 'remarks', $this->remarks])
            ->andFilterWhere(['like', 'plate_number', $this->plate_number])
            ->andFilterWhere(['like', 'driver', $this->driver])
            ->andFilterWhere(['like', 'driver_id', $this->driver_id])
            ->andFilterWhere(['like', 'driver_tel', $this->driver_tel])
            ->andFilterWhere(['like', 'assistant', $this->assistant])
            ->andFilterWhere(['like', 'assistant_id', $this->assistant_id])
            ->andFilterWhere(['like', 'carrier', $this->carrier])
            ->andFilterWhere(['like', 'carrier_tel', $this->carrier_tel])
            ->andFilterWhere(['like', 'customer', $this->customer])
            ->andFilterWhere(['like', 'customer_user', $this->customer_user])
            ->andFilterWhere(['like', 'customer_address', $this->customer_address])
            ->andFilterWhere(['like', 'customer_tel', $this->customer_tel])
            ->andFilterWhere(['like', 'remakes_control', $this->remakes_control])
            ->andFilterWhere(['like', 'jydate', $this->jydate])
            ->andFilterWhere(['like', 'yjdate', $this->yjdate])
            ->andFilterWhere(['like', 'realdate', $this->realdate])
            ->andFilterWhere(['like', 'reback', $this->reback]);

        return $dataProvider;
    }
    
    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function searchKf($params)
    {
        $query = SusoOrder::find();

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

        $this->status=[1,20,-2];
        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'from_id' => $this->from_id,
            'status' => $this->status,
        ]);

        $query->andFilterWhere(['like', 'order_sn', $this->order_sn])
            ->andFilterWhere(['like', 'transport_number', $this->transport_number])
            ->andFilterWhere(['like', 'order_date', $this->order_date])
            ->andFilterWhere(['like', 'shipping_date', $this->shipping_date])
            ->andFilterWhere(['like', 'destination', $this->destination])
            ->andFilterWhere(['like', 'product', $this->product])
            ->andFilterWhere(['like', 'tonnage', $this->tonnage])
            ->andFilterWhere(['like', 'remarks', $this->remarks])
            ->andFilterWhere(['like', 'plate_number', $this->plate_number])
            ->andFilterWhere(['like', 'driver', $this->driver])
            ->andFilterWhere(['like', 'driver_id', $this->driver_id])
            ->andFilterWhere(['like', 'driver_tel', $this->driver_tel])
            ->andFilterWhere(['like', 'assistant', $this->assistant])
            ->andFilterWhere(['like', 'assistant_id', $this->assistant_id])
            ->andFilterWhere(['like', 'carrier', $this->carrier])
            ->andFilterWhere(['like', 'carrier_tel', $this->carrier_tel])
            ->andFilterWhere(['like', 'customer', $this->customer])
            ->andFilterWhere(['like', 'customer_user', $this->customer_user])
            ->andFilterWhere(['like', 'customer_address', $this->customer_address])
            ->andFilterWhere(['like', 'customer_tel', $this->customer_tel])
            ->andFilterWhere(['like', 'remakes_control', $this->remakes_control])
            ->andFilterWhere(['like', 'jydate', $this->jydate])
            ->andFilterWhere(['like', 'yjdate', $this->yjdate])
            ->andFilterWhere(['like', 'realdate', $this->realdate])
            ->andFilterWhere(['like', 'reback', $this->reback]);

        return $dataProvider;
    }
}
