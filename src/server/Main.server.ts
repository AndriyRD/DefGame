import { EventRegister } from "./Core/EventSystem/EventRegister";
import { WeaponEventListener } from "./Weapon/FrontLayer/WeaponEventListener";
import { ApiServiceRegister } from "./Core/ApiService/ApiServiceRegister";
import { EquipmentEventListener } from "./Equipment/FrontLayer/EquipmentEventListener";
import { EquipmentService } from "./Equipment/FrontLayer/EquipmentService";
import { GameSessionManager } from "./GameSession/GameSessionManager";
import { Workspace } from "@rbxts/services"

const manager = new GameSessionManager()
manager.NewSession()