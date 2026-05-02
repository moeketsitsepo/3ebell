import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'theme.dart';
import 'screens/landing_screen.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/my_rides_screen.dart';
import 'screens/driver_dashboard_screen.dart';
import 'screens/admin_overview_screen.dart';
import 'screens/hub_browse_screen.dart';
import 'screens/live_map_screen.dart';
import 'screens/wallet_screen.dart';
import 'screens/profile_settings_screen.dart';
import 'screens/transaction_history_screen.dart';
import 'screens/sign_up_account_type_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/verification_screen.dart';
import 'screens/ride_details_screen.dart';
import 'screens/active_trip_driver_screen.dart';
import 'screens/trip_completed_driver_screen.dart';
import 'screens/add_vehicle_screen.dart';
import 'screens/earnings_breakdown_screen.dart';
import 'screens/admin_verification_queue_screen.dart';
import 'screens/admin_driver_review_screen.dart';
import 'screens/safety_center_screen.dart';
import 'screens/points_summary_screen.dart';
import 'screens/ask_a_friend_screen.dart';
import 'screens/sos_active_screen.dart';
import 'screens/my_vehicles_screen.dart';
import 'screens/maintenance_request_screen.dart';
import 'screens/user_preferences_screen.dart';
import 'screens/report_issue_form_screen.dart';
import 'screens/support_chat_screen.dart';
import 'screens/report_status_screen.dart';
import 'screens/trip_receipt_screen.dart';
import 'screens/shift_summary_screen.dart';
import 'screens/transport_comparison_screen.dart';
import 'screens/admin_user_management_screen.dart';
import 'screens/admin_settings_screen.dart';
import 'screens/two_factor_setup_screen.dart';
import 'screens/admin_audit_logs_screen.dart';
import 'screens/station_details_screen.dart';
import 'screens/trip_rating_flow_screen.dart';
import 'screens/sign_up_registration_screen.dart';
import 'screens/notification_hub_screen.dart';
import 'screens/driver_onboarding_screen.dart';
import 'screens/route_planning_screen.dart';
import 'screens/admin_fleet_insights_screen.dart';
import 'screens/loyalty_rewards_screen.dart';
import 'screens/vehicle_telematics_screen.dart';
import 'screens/commuter_social_hub_screen.dart';
import 'screens/admin_revenue_analytics_screen.dart';
import 'screens/trip_customization_screen.dart';
import 'screens/fleet_maintenance_scheduler_screen.dart';
import 'screens/admin_heatmaps_screen.dart';
import 'screens/commuter_trip_insights_screen.dart';
import 'screens/driver_performance_screen.dart';
import 'screens/admin_operational_dashboard_screen.dart';

void main() {
  runApp(const EBellApp());
}

class EBellApp extends StatelessWidget {
  const EBellApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const LandingScreen(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '/dashboard',
          builder: (context, state) => const DashboardScreen(),
        ),
        GoRoute(
          path: '/my-rides',
          builder: (context, state) => const MyRidesScreen(),
        ),
        GoRoute(
          path: '/driver-dashboard',
          builder: (context, state) => const DriverDashboardScreen(),
        ),
        GoRoute(
          path: '/admin-overview',
          builder: (context, state) => const AdminOverviewScreen(),
        ),
        GoRoute(
          path: '/hub',
          builder: (context, state) => const HubBrowseScreen(),
        ),
        GoRoute(
          path: '/live-map',
          builder: (context, state) => const LiveMapScreen(),
        ),
        GoRoute(
          path: '/wallet',
          builder: (context, state) => const WalletScreen(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileSettingsScreen(),
        ),
        GoRoute(
          path: '/history',
          builder: (context, state) => const TransactionHistoryScreen(),
        ),
        GoRoute(
          path: '/sign-up-type',
          builder: (context, state) => const SignUpAccountTypeScreen(),
        ),
        GoRoute(
          path: '/register',
          builder: (context, state) => const RegistrationScreen(),
        ),
        GoRoute(
          path: '/verify',
          builder: (context, state) => const VerificationScreen(),
        ),
        GoRoute(
          path: '/ride-details/:id',
          builder: (context, state) => RideDetailsScreen(rideId: state.pathParameters['id']!),
        ),
        GoRoute(
          path: '/driver/active-trip',
          builder: (context, state) => const ActiveTripDriverScreen(),
        ),
        GoRoute(
          path: '/driver/trip-completed',
          builder: (context, state) => const TripCompletedDriverScreen(),
        ),
        GoRoute(
          path: '/driver/add-vehicle',
          builder: (context, state) => const AddVehicleScreen(),
        ),
        GoRoute(
          path: '/driver/earnings',
          builder: (context, state) => const EarningsBreakdownScreen(),
        ),
        GoRoute(
          path: '/admin/verifications',
          builder: (context, state) => const AdminVerificationQueueScreen(),
        ),
        GoRoute(
          path: '/admin/driver-review/:id',
          builder: (context, state) => AdminDriverReviewScreen(driverId: state.pathParameters['id']!),
        ),
        GoRoute(
          path: '/safety',
          builder: (context, state) => const SafetyCenterScreen(),
        ),
        GoRoute(
          path: '/safety/sos-active',
          builder: (context, state) => const SOSActiveScreen(),
        ),
        GoRoute(
          path: '/points',
          builder: (context, state) => const PointsSummaryScreen(),
        ),
        GoRoute(
          path: '/friends',
          builder: (context, state) => const AskAFriendScreen(),
        ),
        GoRoute(
          path: '/driver/vehicles',
          builder: (context, state) => const MyVehiclesScreen(),
        ),
        GoRoute(
          path: '/driver/maintenance',
          builder: (context, state) => const MaintenanceRequestScreen(),
        ),
        GoRoute(
          path: '/preferences',
          builder: (context, state) => const UserPreferencesScreen(),
        ),
        GoRoute(
          path: '/support/report',
          builder: (context, state) => const ReportIssueFormScreen(),
        ),
        GoRoute(
          path: '/support/chat',
          builder: (context, state) => const SupportChatScreen(),
        ),
        GoRoute(
          path: '/support/status',
          builder: (context, state) => const ReportStatusScreen(),
        ),
        GoRoute(
          path: '/trip-receipt',
          builder: (context, state) => const TripReceiptScreen(),
        ),
        GoRoute(
          path: '/driver/shift-summary',
          builder: (context, state) => const ShiftSummaryScreen(),
        ),
        GoRoute(
          path: '/hub/compare',
          builder: (context, state) => const TransportComparisonScreen(),
        ),
        GoRoute(
          path: '/admin/users',
          builder: (context, state) => const AdminUserManagementScreen(),
        ),
        GoRoute(
          path: '/admin/settings',
          builder: (context, state) => const AdminSettingsScreen(),
        ),
        GoRoute(
          path: '/security/2fa',
          builder: (context, state) => const TwoFactorSetupScreen(),
        ),
        GoRoute(
          path: '/admin/audit-logs',
          builder: (context, state) => const AdminAuditLogsScreen(),
        ),
        GoRoute(
          path: '/station/details',
          builder: (context, state) => const StationDetailsScreen(),
        ),
        GoRoute(
          path: '/trip/rate',
          builder: (context, state) => const TripRatingFlowScreen(),
        ),
        GoRoute(
          path: '/signup',
          builder: (context, state) => const SignUpRegistrationScreen(),
        ),
        GoRoute(
          path: '/notifications',
          builder: (context, state) => const NotificationHubScreen(),
        ),
        GoRoute(
          path: '/driver/onboarding',
          builder: (context, state) => const DriverOnboardingScreen(),
        ),
        GoRoute(
          path: '/plan/route',
          builder: (context, state) => const RoutePlanningScreen(),
        ),
        GoRoute(
          path: '/admin/fleet',
          builder: (context, state) => const AdminFleetInsightsScreen(),
        ),
        GoRoute(
          path: '/rewards',
          builder: (context, state) => const LoyaltyRewardsScreen(),
        ),
        GoRoute(
          path: '/driver/telematics',
          builder: (context, state) => const VehicleTelematicsScreen(),
        ),
        GoRoute(
          path: '/social-hub',
          builder: (context, state) => const CommuterSocialHubScreen(),
        ),
        GoRoute(
          path: '/admin/revenue',
          builder: (context, state) => const AdminRevenueAnalyticsScreen(),
        ),
        GoRoute(
          path: '/trip/customize',
          builder: (context, state) => const TripCustomizationScreen(),
        ),
        GoRoute(
          path: '/driver/maintenance-schedule',
          builder: (context, state) => const FleetMaintenanceSchedulerScreen(),
        ),
        GoRoute(
          path: '/admin/heatmaps',
          builder: (context, state) => const AdminHeatmapsScreen(),
        ),
        GoRoute(
          path: '/commuter/insights',
          builder: (context, state) => const CommuterTripInsightsScreen(),
        ),
        GoRoute(
          path: '/driver/performance',
          builder: (context, state) => const DriverPerformanceScreen(),
        ),
        GoRoute(
          path: '/admin/operations',
          builder: (context, state) => const AdminOperationalDashboardScreen(),
        ),
      ],
    );

    return MaterialApp.router(
      title: 'EBell',
      theme: AppTheme.darkTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
