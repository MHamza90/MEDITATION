<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id ?? '',
            'name' => $this->name ?? '',
            'email' => $this->email ?? '',
            'phone_number' => $this->phone_number ?? '',
            'avatar' => $this->avatar ?? '',
            'is_verified' => $this->is_verified ?? '',
            'referral_code' => $this->referral_code ?? '',
            'reference_id' => $this->reference_id ?? '',
            'my_id' => $this->my_id ?? '',
            'first_name' => $this->first_name ?? '',
            'last_name' => $this->last_name ?? '',
            'date_of_birth' => $this->date_of_birth ?? '',
            'document_id' => $this->document_id ?? '',
            'front_side' => $this->front_side ?? '',
            'back_side' => $this->back_side ?? '',
            'device_token' => $this->device_token ?? '',
            'status' => $this->status ?? '',
            'position' => $this->whenLoaded('position', function () {
                return [
                    'position_id' => $this->position->id,
                    'position_name' => $this->position->name,
                    // ... other position attributes
                ];
            }),
        ];
    }
}
