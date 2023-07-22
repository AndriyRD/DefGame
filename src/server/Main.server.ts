import { EventRegister } from "./Core/EventSystem/EventRegister";
import { WeaponEventListener } from "./Weapon/FrontLayer/WeaponEventListener";
import { ApiServiceRegister } from "./Core/ApiService/ApiServiceRegister";
import { EquipmentEventListener } from "./Equipment/FrontLayer/EquipmentEventListener";
import { EquipmentService } from "./Equipment/FrontLayer/EquipmentService";
import { Workspace } from "@rbxts/services"
import { GameSessionManager } from "./GameLoader/GameSession/GameSessionManager";

const manager = new GameSessionManager()
manager.NewSession()