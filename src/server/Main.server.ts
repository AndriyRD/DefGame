import { EventRegister } from "./Core/EventSystem/EventRegister";
import { WeaponEventListener } from "./Weapon/FrontLayer/WeaponEventListener";
import { ApiServiceRegister } from "./Core/ApiService/ApiServiceRegister";
import { EquipmentEventListener } from "./Equipment/FrontLayer/EquipmentEventListener";
import { EquipmentService } from "./Equipment/FrontLayer/EquipmentService";
import { GameSessionManager } from "./GameSession/GameSessionManager";
import { Workspace } from "@rbxts/services";

// new ApiServiceRegister()
//     .Register(new EquipmentService())

// new EventRegister()
//     .Register(new WeaponEventListener())
//     .Register(new EquipmentEventListener())

const manager = new GameSessionManager()
manager.NewSession()